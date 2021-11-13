class Platform extends Motion {
    float a;
    color col;
    boolean onTop, moveLeftRight, moveRightLeft;
    Platform(float x, float y, float w_, float h_) {
        col = color(0, 0, 255);
        pos.set(x, y);
        w = w_;
        h = h_;
        rect = new DVector();
        rect.w = w;
        rect.h = h;
        camera.worldToScreen(pos, rect);
        a = 0;
    }
    void show() {
        fill(col);
        noStroke();
        rectToScreenPos();
        rect(rect.x, rect.y, rect.w, rect.h);
    }
    void update() {
        float velo = 0;
        if (moveLeftRight) {
            velo = cos(a + PI) * 4;
            pos.x += velo;
            super.update();
            a += 0.03;
        } else if (moveRightLeft) {
            velo = cos(a) * 4;
            pos.x += velo;
            super.update();
            a += 0.03;
        }
        if (onTop) player.pos.x += velo;

    }
}

class Platforms {
    Platform[] platforms_;
    Platforms() {
        platforms_ = new Platform[7];
        platforms_[0] = new Platform(-width * 0.5 + 10, -height * 0.5, width * 2 - 20, 10);
        platforms_[1] = new Platform(-width * 0.5 + 10, height * 1.5 - 10, width * 2 - 20, 10);
        platforms_[2] = new Platform(-width * 0.5, -height * 0.5, 10, height * 2);
        platforms_[3] = new Platform(width * 1.5 - 10, -height * 0.5, 10, height * 2);
        platforms_[4] = new Platform(width * 0.25 - 100, height - 150, 200, 20);
        platforms_[4].col = color(100, 50, 25);
        platforms_[4].moveRightLeft = true;
        platforms_[5] = new Platform(width * 0.75 - 100, height - 150, 200, 20);
        platforms_[5].moveLeftRight = true;
        platforms_[5].col = color(100, 50, 25);
        platforms_[6] = new Platform(width * 0.5 - 100, height - 75, 200, 20);
        platforms_[6].col = color(100, 50, 25);
    }
    void update() {
        for (Platform platform : platforms_) platform.update();
    }
    void show() {
        for (Platform platform : platforms_) platform.show();
    }
}