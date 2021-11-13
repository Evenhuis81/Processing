class Seeker extends Motion {
    Vi4d screenPos;
    int w, h;
    Seeker() {
        h = height / 24;
        w = h / 2;
        pos.set(width * 0.3, height * 0.3);
        limitVelX = true;
        limitVelY = true;
        // minVelX = true;
        // minVelY = true;
        maxVel.set(20, 20);
        screenPos = new Vi4d();
        resetAcc = true;
    }
    void update() {
        // frictionX = collisionSide == "bottom" && !left && !right;
        super.update();
    }
    void show() {
        fill(128, 128, 0);
        noStroke();
        tv.drawRect(pos.x, pos.y, pos.x + w, pos.y + h, screenPos);
    }

    // void setGravity(boolean flag) {
    //     if (flag) acc.y += 0.6;
    //     else acc.y -= 0.6;
    // }
    // void up(boolean flag) {
    //     if (flag && !up) {
    //         up = true;
    //         acc.y -= .2;
    //     } else if (!flag) {
    //         up = false;
    //         acc.y += .2;
    //     }
    // }
    // void down(boolean flag) {
    //     if (flag && !down) {
    //         down = true;
    //         acc.y += .2;
    //     } else if (!flag) {
    //         down = false;
    //         acc.y -= .2;
    //     }
    // }
    // void left(boolean flag) {
    //     if (flag && !left) {
    //         left = true;
    //         acc.x -= .2;
    //     } else if (!flag) {
    //         left = false;
    //         acc.x += .2;
    //     }
    // }
    // void right(boolean flag) {
    //     if (flag && !right) {
    //         right = true;
    //         acc.x += .2;
    //     } else if (!flag) {
    //         right = false;
    //         acc.x -= .2;
    //     }
    // }
    // void jump(boolean flag) {
    //     // if (flag && collisionSide == "bottom") vel.y = jumpVel;
    //     jump = flag;
    // }
    // // PVector worldCenter() {
    //     // return new PVector(rect.x + w/2, rect.y + h/2);
    // // }
    PVector screenCenter() {
        return new PVector(pos.x + w/2, pos.y + h/2);
    }
}