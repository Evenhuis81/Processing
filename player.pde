class Player extends Motion {
    Vi4d screenPos;
    boolean up, down, left, right, jump;
    float jumpVel;
    int w, h;
    // String collisionSide;
    Player() {
        h = height / 12;
        w = h / 2;
        pos.set(width/2 - w/2, height/2 - h/2);
        limitVelX = true;
        limitVelY = true;
        minVelX = true;
        maxVel.set(25, 25);
        jumpVel = -15;
        screenPos = new Vi4d();
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
            acc.y -= .2;
        } else if (!flag) {
            up = false;
            acc.y += .2;
        }
    }
    void down(boolean flag) {
        if (flag && !down) {
            down = true;
            acc.y += .2;
        } else if (!flag) {
            down = false;
            acc.y -= .2;
        }
    }
    void left(boolean flag) {
        if (flag && !left) {
            left = true;
            acc.x -= .2;
        } else if (!flag) {
            left = false;
            acc.x += .2;
        }
    }
    void right(boolean flag) {
        if (flag && !right) {
            right = true;
            acc.x += .2;
        } else if (!flag) {
            right = false;
            acc.x -= .2;
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