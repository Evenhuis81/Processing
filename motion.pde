class Motion {
    PVector pos, vel, acc, maxVel;
    boolean limitVelX, limitVelY, minVelX, minVelY, resetAcc, frictionX;
    Motion() {
        pos = new PVector(0, 0);
        vel = new PVector(0, 0);
        acc = new PVector(0, 0);
        maxVel = new PVector (0, 0);
    }
    void follow(PVector targetPos) {
        PVector force = PVector.sub(targetPos, pos);
        // println(force.mag());
        // force.setMag(10);
        float distance = force.mag();
        int range = 100;
        float maxSpeed = 20;
        if (distance < range) {
            maxSpeed = map(distance, 0, range, 0, 20);
            // println(maxSpeed);
        }
        force.setMag(maxSpeed);
        force.sub(vel);
        acc.add(force);
    }
    void seek(PVector target) {
        PVector force = PVector.sub(target, pos);  // desired velocity
        force.setMag(5);
        force.sub(vel);
        force.limit(0.3);
        acc.add(force);
    }
    void update() {
        vel.add(acc);
        limit(vel);
        if (frictionX) vel.x *= .92;
        pos.add(vel);
        if (resetAcc) acc.set(0, 0);
    }
    void limit(PVector force) {
        if (limitVelX && force.x > maxVel.x) force.x = maxVel.x;
        else if (limitVelX && force.x < -maxVel.x) force.x = -maxVel.x;
        if (limitVelY && force.y > maxVel.y) force.y = maxVel.y;
        else if (limitVelY && force.y < -maxVel.y) force.y = -maxVel.y;
        if (minVelX && abs(force.x) < 0.2) force.x = 0;
        if (minVelY && abs(force.y) < 0.2) force.y = 0;
    }
}