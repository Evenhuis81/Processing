class Player extends Motion {
    Vi4d screenPos;
    boolean up, down, left, right, jump;
    float jumpVel, accInc;
    int w, h;
    // String collisionSide;
    Player() {
        h = height / 12;
        w = h / 2;
        pos.set(width/2, height/2);
        limitVelX = true;
        limitVelY = true;
        minVelX = true;
        maxVel.set(10, 20);
        jumpVel = -15;
        screenPos = new Vi4d();
        accInc = 0.8;
    }
    void update() {
        // frictionX = collisionSide == "bottom" && !left && !right;
        super.update();
    }
    void show() {
        fill(0, 128, 128);
        noStroke();
        tv.drawRect(pos.x, pos.y, pos.x + w, pos.y + h, screenPos);
    }

    void setGravity(boolean flag) {
        if (flag) acc.y += 0.6;
        else acc.y -= 0.6;
    }
    void up(boolean flag) {
        if (flag && !up) {
            up = true;
            acc.y -= accInc;
        } else if (!flag) {
            up = false;
            acc.y += accInc;
        }
    }
    void down(boolean flag) {
        if (flag && !down) {
            down = true;
            acc.y += accInc;
        } else if (!flag) {
            down = false;
            acc.y -= accInc;
        }
    }
    void left(boolean flag) {
        if (flag && !left) {
            left = true;
            acc.x -= accInc;
        } else if (!flag) {
            left = false;
            acc.x += accInc;
        }
    }
    void right(boolean flag) {
        if (flag && !right) {
            right = true;
            acc.x += accInc;
        } else if (!flag) {
            right = false;
            acc.x -= accInc;
        }
    }
    void jump(boolean flag) {
        // if (flag && collisionSide == "bottom") vel.y = jumpVel;
        jump = flag;
    }
    // PVector worldCenter() {
        // return new PVector(rect.x + w/2, rect.y + h/2);
    // }
    PVector screenCenter() {
        return new PVector(pos.x + w/2, pos.y + h/2);
    }
}