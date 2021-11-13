class Seeker extends Motion {
    Vi2d screenPos;
    int w, h, r;
    Seeker() {
        h = height / 24;
        w = h / 2;
        // pos.set(width * 0.1, height * 0.9);
        pos.set(player.pos.x, player.pos.y);
        limitVelX = true;
        limitVelY = true;
        maxVel.set(10, 20);
        screenPos = new Vi2d();
        resetAcc = true;
        r = 8;
    }
    void show() {
        fill(128, 255, 128);
        noStroke();
        tv.drawCircle(pos.x, pos.y, r, screenPos);
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