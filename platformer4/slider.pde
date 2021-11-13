class Slider extends Motion {
    float min, max, current, step, length;
    int r;
    Slider(float x, float y) {
        pos.set(x, y);
        length = 100;
        min = 0;
        max = 0;
        current = 0;
        r = 5;
    }
    void show() {
        stroke(255);
        strokeWeight(3 * camera.scale.x);
        line(pos.x, pos.y, pos.x + length, pos.y);
        noStroke();
        fill(255, 100, 50);
        println(length/current);
        ellipse(pos.x + current * length, pos.y, r*2, r*2);
    }
    boolean inside() {
        // ellipse

        // line
        return true;
    }
}