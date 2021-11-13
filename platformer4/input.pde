void keyPressed() {
    char keyLow = Character.toLowerCase(key);

    if (key == 'w') player.up(true);
    if (key == 's') player.down(true);
    if (key == 'a') player.left(true);
    if (key == 'd') player.right(true);
    if (key == ' ' && !player.jump) player.jump(true);
}

void keyReleased() {
    char keyLow = Character.toLowerCase(key);
    if (key == 'w') player.up(false);
    if (key == 's') player.down(false);
    if (key == 'a') player.left(false);
    if (key == 'd') player.right(false);
    if (key == ' ') player.jump(false);
}

void mouseReleased() {
    if (button.inside()) {
        button.toggle();
        player.setGravity(button.flag);
    }
}

float fStartPanX = 0;
float fStartPanY = 0;
float fScaleX = 1;
float fScaleY = 1;
void mousePressed() {
    if (mouseButton == LEFT) {
        // if (slider.inside()) {
        //     println("inside");
        // }
    }
    if (mouseButton == CENTER) {
        fStartPanX = mouseX;
        fStartPanY = mouseY;
    }
}

void mouseDragged() {
    if (mouseButton == CENTER) {
        camera.pos.x -= (mouseX - fStartPanX) / fScaleX;
        camera.pos.y -= (mouseY - fStartPanY) / fScaleY;
        fStartPanX = mouseX;
        fStartPanY = mouseY;
    }
}

float fMouseWorldX_BeforeZoom, fMouseWorldY_BeforeZoom;
float fMouseWorldX_AfterZoom, fMouseWorldY_AfterZoom;
void mousePanBeforeZoom() {
    PVector mouseWorld = new PVector();
    camera.screenToWorld(new PVector(mouseX, mouseY), mouseWorld);
    fMouseWorldX_BeforeZoom = mouseWorld.x;
    fMouseWorldY_BeforeZoom = mouseWorld.y;
}
void mousePanAfterZoom() {
    PVector mouseWorld = new PVector();
    camera.screenToWorld(new PVector(mouseX, mouseY), mouseWorld);
    fMouseWorldX_AfterZoom = mouseWorld.x;
    fMouseWorldY_AfterZoom = mouseWorld.y;
    camera.pos.x += (fMouseWorldX_BeforeZoom - fMouseWorldX_AfterZoom);
    camera.pos.y += (fMouseWorldY_BeforeZoom - fMouseWorldY_AfterZoom);
}
// void mouseReleased() {
//     // if (mouseButton == RIGHT) {
//     //     fSelectedCellX = (int) fMouseWorldX_AfterZoom;
//     //     fSelectedCellY = (int) fMouseWorldY_AfterZoom;
//     // }
void mouseWheel(MouseEvent e) {
    if (e.getCount() == 1) { // down - zoom out
        mousePanBeforeZoom();
        camera.scale.x *= 0.9;
        camera.scale.y *= 0.9;
        mousePanAfterZoom();
    } else if (e.getCount() == -1) { // up - zoom in
        mousePanBeforeZoom();
        camera.scale.x *= 1.1;
        camera.scale.y *= 1.1;
        mousePanAfterZoom();
    }
}