class Motion {
    PVector pos, vel, acc, maxVel;
    DVector rect, ellipse;
    float maxForce, w, h, r;
    boolean limitVelX, limitVelY, minVelX, minVelY, resetAcc, frictionX;
    Motion() {
        pos = new PVector(0, 0);
        vel = new PVector(0, 0);
        acc = new PVector(0, 0);
        maxVel = new PVector(0, 0);
        maxForce = 0;
    }
    void update() {
        vel.add(acc);
        limit();
        if (frictionX) vel.x *= .92;
        pos.add(vel);
        if (resetAcc) acc.set(0, 0);
    }
    void seek(PVector target_, boolean arrive_) {
        PVector force = PVector.sub(target_, pos); // desired velocity
        int slowRadius = 100;
        float distance = force.mag();
        float maxSpeed;
        if (arrive_ && distance < slowRadius) maxSpeed = map(distance, 0, slowRadius, 0, maxVel.mag());
        else maxSpeed =  maxVel.mag();
        force.setMag(maxSpeed).sub(vel).limit(maxForce);
        acc.add(force);
    }
    void limit() {
        if (limitVelX && vel.x > maxVel.x) vel.x = maxVel.x;
        else if (limitVelX && vel.x < -maxVel.x) vel.x = -maxVel.x;
        if (limitVelY && vel.y > maxVel.y) vel.y = maxVel.y;
        else if (limitVelY && vel.y < -maxVel.y) vel.y = -maxVel.y;
        if (minVelX && abs(vel.x) < 0.2) vel.x = 0;
        if (minVelY && abs(vel.y) < 0.2) vel.y = 0;
    }
    void rectToScreenPos() {
        camera.worldToScreen(pos, rect);
    }
    void ellipseToScreenPos() {
        camera.worldToScreen(pos, ellipse);
    }
}