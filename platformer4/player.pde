class Player extends Motion {
    boolean up, down, left, right, jump;
    float jumpVel;
    String collisionSide;
    Player(float x, float y) {
        pos.set(x, y);
        w = 30;
        h = 60;
        limitVelX = true;
        limitVelY = true;
        minVelX = true;
        maxVel.set(5, 15);
        jumpVel = -15;
        rect = new DVector();
        rect.w = w;
        rect.h = h;
        camera.worldToScreen(pos, rect);
    }
    void update() {
        frictionX = collisionSide == "bottom" && !left && !right;
        super.update();
    }
    void show() {
        fill(200, 0, 0);
        noStroke();
        rectToScreenPos();
        rect(rect.x, rect.y, rect.w, rect.h);
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
        if (flag && collisionSide == "bottom") vel.y = jumpVel;
        jump = flag;
    }
    PVector centerWorldPos() {
        return new PVector(rect.x + w/2, rect.y + h/2);
    }
    PVector centerScreenPos() {
        return new PVector(pos.x + w/2, pos.y + h/2);
    }
}