class Slider {
    PVector pos;
    int length = 900;
    float min, max, range, steps, current;
    float cPos;
    boolean sliding;
    Slider() {
        pos = new PVector(100, 100);
        min = 4;
        max = 12;
        range = max - min;
        steps = 0.5;
        current = 8.5;
    }
    void show() {
        // selector
        fill(255, 0, 0);
        stroke(0, 0, 255);
        strokeWeight(1);
        // cPos = length * ((range / current) * steps);
        cPos = map(current, min, max, pos.x, pos.x + length);
        if (sliding) {
            float mP = map(mouseX, pos.x, pos.x + length, 0, range/steps);
            float sP = min + steps * (round(mP));
            cPos = map(sP, min, max, pos.x, pos.x + length);
            println(sP);
            // println(mP);
            ellipse(cPos, pos.y, 10, 10);
        } else ellipse(cPos, pos.y, 10, 10);
        // line
        stroke(255);
        strokeWeight(2);
        line(pos.x, pos.y, pos.x + length, pos.y);
        // steps
        strokeWeight(4);
        for (float i = 0; i <= range / steps; i++) {
            float xP = map(i, 0, range / steps, pos.x, pos.x + length);
            point(xP, pos.y - 15);
            textAlign(CENTER);
            text(String.format("%.2f" , min + i * steps), xP, pos.y - 30);
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