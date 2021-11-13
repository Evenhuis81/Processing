class Button {
    float x, y, w, h;
    boolean flag;
    Button() {
        x = width - 70;
        y = 30;
        w = 50;
        h = 20;
    }
    void show() {
        fill(0);
        stroke(255);
        strokeWeight(2);
        rect(x, y, w, h);
        fill(255);
        textSize(16);
        textAlign(CENTER);
        text("gravity", x + w/2, y + h/2 + textDescent());
    }
    void toggle() {
        flag = !flag;
    }
    boolean inside() {
        return mouseX >= x && mouseX < x + w && mouseY >= y && mouseY < y + h;
    }
}