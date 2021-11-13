class Slider {
    PVector pos;
    int length = 500;
    float min, max, range, steps, current;
    float cPos;
    boolean sliding;
    Slider(float x, float y, float min_, float max_, float steps_, float current_) {
        pos = new PVector(x, y);
        min = min_;
        max = max_;
        range = max - min;
        steps = steps_;
        current = current_;
    }
    void show() {
        // selector
        fill(255, 0, 0);
        stroke(0, 0, 255);
        strokeWeight(1);
        if (sliding) {
            float mP = map(mouseX, pos.x, pos.x + length, 0, range/steps);
            float sP = min + steps * (round(mP));
            cPos = map(sP, min, max, pos.x, pos.x + length);
        } else cPos = map(current, min, max, pos.x, pos.x + length);
        ellipse(cPos, pos.y, 10, 10);
        // line
        stroke(255);
        strokeWeight(2);
        line(pos.x, pos.y, pos.x + length, pos.y);
        // steps
        strokeWeight(4);
        for (float i = 0; i <= range / steps; i++) {
            float xP = map(i, 0, range / steps, pos.x, pos.x + length);
            point(xP, pos.y - 15);
            // textAlign(CENTER);
            // text(String.format("%.2f" , min + i * steps), xP, pos.y - 30);
        }
    }
    void release() {


        sliding = false;
    }
    boolean selectorInside() {
        float distX = cPos - mouseX;
        float distY = pos.y - mouseY;
        float distance = sqrt((distX * distX) + (distY * distY));
        return distance < 10;
    }
}