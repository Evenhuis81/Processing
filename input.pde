void keyPressed() {
    char keyLow = Character.toLowerCase(key);

    if (key == 'w') player.up(true);
    if (key == 's') player.down(true);
    if (key == 'a') player.left(true);
    if (key == 'd') player.right(true);
    // if (key == ' ' && !player.jump) player.jump(true);
    if (key == 'g') player.setGravity(true);
}

void keyReleased() {
    char keyLow = Character.toLowerCase(key);
    if (key == 'w') player.up(false);
    if (key == 's') player.down(false);
    if (key == 'a') player.left(false);
    if (key == 'd') player.right(false);
    // if (key == ' ') player.jump(false);
    if (key == 'g') player.setGravity(false);
}

void mousePressed() {
    if (mouseButton == CENTER) tv.startPan(mouseX, mouseY);
    if (mouseButton == LEFT && slider.selectorInside()) {
        slider.sliding = true;
    }
}
void mouseReleased() {
    if (mouseButton == LEFT && slider.sliding) slider.release();
}

void mouseDragged() {
    if (mouseButton == CENTER) tv.updatePan(mouseX, mouseY);
}

void mouseWheel(MouseEvent e) {
    if (e.getCount() > 0) tv.zoom(mouseX, mouseY, true); // zoom out
    else tv.zoom(mouseX, mouseY, false);
}