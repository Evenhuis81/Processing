class DVector {
    float x, y, w, h, r;
    DVector() {
        x = 0;
        y = 0;
        w = 0;
        h = 0;
    }
    DVector(PVector pos, float w_, float h_) {
        pos.x = x;
        pos.y = y;
        w = w_;
        h = h_;
    }
    DVector(float x_, float y_) {
        x = x_;
        y = y_;
    }
    void setPos(float x_, float y_) {
        x = x_;
        y = y_;
    }
}