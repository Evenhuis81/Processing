class Motion {
    PVector pos, vel, acc, maxVel;
    boolean limitVelX, limitVelY, minVelX, minVelY, resetAcc, frictionX;
    int count;
    float[] followX1, followX2, followY1, followY2;
    Motion() {
        pos = new PVector(0, 0);
        vel = new PVector(0, 0);
        acc = new PVector(0, 0);
        maxVel = new PVector (0, 0);
        followX1 = new float[20];
        followX2 = new float[20];
        followY1 = new float[20];
        followY2 = new float[20];
        count = 0;
    }
    void follow(PVector targetPos) {
        if (count > 19) {
            if (count % 40 > 19) {
                pos.x = followX1[count % 20];
                pos.y = followY1[count % 20];
                followX2[count % 20] = targetPos.x + player.w/2;
                followY2[count % 20] = targetPos.y + player.h/2;
            } else {
                pos.x = followX2[count % 20];
                pos.y = followY2[count % 20];
                followX1[count % 20] = targetPos.x + player.w/2;
                followY1[count % 20] = targetPos.y + player.h/2;
            }
        } else {
            followX1[count] = targetPos.x + player.w/2;
            followY1[count] = targetPos.y + player.h/2;
            pos.x = followX1[0];
            pos.y = followY1[0];
        }
        count++;
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