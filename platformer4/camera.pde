class Camera extends Motion {
    PVector worldTopLeft, worldBottomRight, scale, target, posBefore, posAfter;
    Boolean seek;
    Camera() {}
    Camera(float x, float y) {
        pos.set(x, y); // camera.pos.x, fOffsetY
        scale = new PVector(1, 1);
        target = new PVector(0, 0);
        posBefore = new PVector(0, 0);
        posAfter = new PVector(0, 0);
        maxForce = 0.6;
        limitVelX = true;
        limitVelY = true;
        maxVel.set(5, 15);
        resetAcc = true;
        seek = false;
    }
    void follow(PVector target_, boolean flag) {
        if (!seek) {
            posBefore.set(width/2, height/2);
            seek = true;
        } else {
            posAfter.set(target_.x, target_.y);
            target.add(PVector.sub(posAfter, posBefore));
            posBefore.set(target_.x, target_.y);
            seek(target, flag);
            update();
            // resolve gameworld bounds
            if (pos.x < -width * 0.5) pos.x = -width * 0.5;
            else if (pos.x > width * 0.5) pos.x = width * 0.5;
            if (pos.y > height/2) pos.y = height/2;
            else if (pos.y < -height/2) pos.y = -height/2;
        }
    }
    // Convert coordinates from World Space --> Screen Space
    void worldToScreen(PVector worldPos, DVector screenPos) {
        // int ScreenX = (int) ((worldPos.x - pos.x) * scale.x);
        float screenX = (worldPos.x - pos.x) * scale.x;
        float screenY = (worldPos.y - pos.y) * scale.y;
        screenPos.setPos(screenX, screenY);
    }
    // Convert coordinates from Screen Space --> World Space
    void screenToWorld(PVector screenPos, PVector worldPos) {
        float fWorldX = screenPos.x / scale.x + pos.x;
        float fWorldY = screenPos.y / scale.y + pos.y;
        worldPos.set(fWorldX, fWorldY);
    }
    String[] level;
    void level() {
        level = new String[] {            
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooox",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxaaxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
            "xoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooox",
            "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
        };
    }
    void grid(int cols_, int rows_) {
        int cols = cols_;
        int rows = rows_;
        int colW = (width * 2) / cols;
        int rowH = (height * 2) / rows;
        char[] cells = new char[cols * rows];
        noFill();
        stroke(128);
        strokeWeight(1);
        for (int i = 0; i < cols; i++) {
            for (int j = 0; j < rows; j++) {
                switch (level[j].charAt(i)) {
                    case 'x' :
                        PVector worldPos = new PVector(i * colW - width * .5, j * rowH - height * .5);
                        DVector screenPos = new DVector(.0, .0);
                        worldToScreen(worldPos, screenPos);
                        noFill();
                        rect(screenPos.x, screenPos.y, colW, rowH);
                    break;
                    case 'o' :
                        PVector worldPos2 = new PVector(i * colW - width * .5, j * rowH - height * .5);
                        DVector screenPos2 = new DVector(.0, .0);
                        worldToScreen(worldPos2, screenPos2);
                        fill(100, 100, 100, 100);
                        rect(screenPos2.x, screenPos2.y, colW, rowH);
                    break;
                }
            }
        }
    }
//     float fSelectedCellX = 0;
//     float fSelectedCellY = 0;
// //     void run() {
// //         // mousePanBeforeZoom();
// //         // keyZoom();
// //         // mousePanAfterZoom();
// //         // grid();
// //         // selection();

// //     }
// //         float[] fWorldTopLeft = screenToWorld(0, 0);
    // float[] fWorldBottomRight = screenToWorld(width, height);
    // int nLinesDrawn = 0;

    // // Draw 10 horizontal lines
    // for (float y = 0; y <= 10; y++) {
    //     if (y >= fWorldTopLeft[1] && y <= fWorldBottomRight[1]) {
    //         float sx = 0, sy = y, ex = 10, ey = y;
    //         int[] start = worldToScreen(sx, sy);
    //         int[] end = worldToScreen(ex, ey);
    //         stroke(255);
    //         strokeWeight(1 / scale.x);
    //         line(start[0], start[1], end[0], end[1]);
    //         nLinesDrawn++;
    //     }
    // }

    // // Draw 10 vertical lines
    // for (float x = 0; x <= 10; x++) {
//         if (x >= fWorldTopLeft[0] && x <= fWorldBottomRight[0]) {
//             float sx = x, sy = 0, ex = x, ey = 10;
//             int[] start = worldToScreen(sx, sy);
//             int[] end = worldToScreen(ex, ey);
//             stroke(255);
//             strokeWeight(1 / scale.x);
//             line(start[0], start[1], end[0], end[1]);
//             nLinesDrawn++;
//         }
//     }

//     int[] selectedCell = worldToScreen(fSelectedCellX + 0.5, fSelectedCellY + 0.5);
//     fill(255, 0, 0);
//     noStroke();
//     circle(selectedCell[0], selectedCell[1], 0.3 * scale.x);

//     fill(255);
//     textSize(16);
//     text("Lines Drawn: " + nLinesDrawn, width/2, height * 0.1);
// }
// //     void keyZoom() {
// //         if (qPressed) {
// //             scale.x *= 1.03;
// //             scale.y *= 1.03;

// //         } else if (aPressed) {
// //             scale.x *= 0.97;
// //             scale.y *= 0.97;
// //         };
}