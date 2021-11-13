class TransformedView extends Motion {
    PVector scale, target, posBefore, posAfter;
    Vi4d screenBounds, pan;
    Vf4d worldSize, worldZoom;
    float scaleValue;
    boolean seek;
    TransformedView() {
        rectMode(CORNERS);
        scale = new PVector(1, 1);
        screenBounds = new Vi4d();
        worldSize = new Vf4d();
        worldZoom = new Vf4d();
        pan = new Vi4d();
        posBefore = new PVector();
        posAfter = new PVector();
        target = new PVector();
    }
    void follow(PVector target_) {
        if (!seek) {
            posBefore.set(width/2, height/2);
            seek = true;
        } else {
            posAfter.set(target_.x, target_.y);
            target.add(PVector.sub(posAfter, posBefore));
            posBefore.set(target_.x, target_.y);
            super.follow(target);
            update();
            // resolveWorldBounds();
        }
        // super.follow(target);
    }
    void resolveWorldBounds() {
        // no resolve when gameworld < screen
        if (screenBounds.x2-screenBounds.x1 < width || screenBounds.y2 - screenBounds.y1 < height) return;
        if (pos.x < worldSize.x1) {
            vel.x = 0;
            pos.x = worldSize.x1;
        } else if (pos.x + width / scale.x > worldSize.x2) {
            vel.x = 0;
            pos.x = worldSize.x2 - width / scale.x;
        }
        if (pos.y < worldSize.y1) {
            pos.y = worldSize.y1;
            vel.y = 0;
        } else if (pos.y + height / scale.y > worldSize.y2) {
            vel.y = 0;
            pos.y = worldSize.y2 - height / scale.y;
        }
    }
    void setWorldSize(float x1, float y1, float x2, float y2) {
        worldSize.set(x1, y1, x2, y2);
    }
    void drawBounds() {
        stroke(255, 0, 0);
        strokeWeight(3 * scale.x); // strokeWidth not in collision detection yet, replace with rect ?aaaasasasasssssssss
        noFill();
        worldToScreenRect(worldSize.x1, worldSize.y1, worldSize.x2, worldSize.y2, screenBounds);
        rect(screenBounds.x1, screenBounds.y1, screenBounds.x2, screenBounds.y2);
    }
    void drawRect(float worldX1, float worldY1, float worldX2, float worldY2, Vi4d screenPos) {
        worldToScreenRect(worldX1, worldY1, worldX2, worldY2, screenPos);
        rect(screenPos.x1, screenPos.y1, screenPos.x2, screenPos.y2);
    }
    void drawCircle(float worldX, float worldY, int r, Vi2d screenPos) {
        worldToScreenCircle(worldX, worldY, r, screenPos);
        ellipse(screenPos.x, screenPos.y, r * scale.x, r * scale.y);
    }
    void worldToScreenCircle(float worldX, float worldY, int r, Vi2d screenPos) {
        screenPos.x = (int) ((worldX - pos.x) * scale.x);
        screenPos.y = (int) ((worldY - pos.y) * scale.y);
    }
    void worldToScreenRect(float worldX1, float worldY1, float worldX2, float worldY2, Vi4d screenPos) {
        screenPos.x1 = (int) ((worldX1 - pos.x) * scale.x);
        screenPos.y1 = (int) ((worldY1 - pos.y) * scale.y);
        screenPos.x2 = (int) ((worldX2 - pos.x) * scale.x);
        screenPos.y2 = (int) ((worldY2 - pos.y) * scale.y);
    }
    void screenToWorldBeforeZoom(int screenX, int screenY) {
        worldZoom.x1 = screenX / scale.x + pos.x;
        worldZoom.y1 = screenY / scale.y + pos.y;
    }
    void screenToWorldAfterZoom(int screenX, int screenY) {
        worldZoom.x2 = screenX / scale.x + pos.x;
        worldZoom.y2 = screenY / scale.y + pos.y;
    }
    void startPan(int x, int y) {
        pan.x1 = x;
        pan.y1 = y;
    }
    void updatePan(int x, int y) {
        // end pan
        pan.x2 = x;
        pan.y2 = y;
        // set pos
        pos.x -= (pan.x2 - pan.x1) / scale.x;
        pos.y -= (pan.y2 - pan.y1) / scale.y;
        // update pan
        pan.x1 = x;
        pan.y1 = y;
    }
    void zoom(int x, int y, boolean flag) {
        screenToWorldBeforeZoom(x, y);
        scaleValue = flag ? 0.9 : 1.1; // out : in
        scale.mult(scaleValue);
        screenToWorldAfterZoom(x, y);
        pos.x -= (worldZoom.x2 - worldZoom.x1);
        pos.y -= (worldZoom.y2 - worldZoom.y1);
    }
}