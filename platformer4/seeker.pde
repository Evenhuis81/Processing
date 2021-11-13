class Seeker extends Motion {
    PVector target, posBefore, posAfter;
    boolean seek;
    Seeker() {
        pos.set(20, 20);
        target = new PVector(0, 0);
        posBefore = new PVector(0, 0);
        posAfter = new PVector(0, 0);
        r = 5;
        maxForce = 0.6;
        limitVelX = true;
        limitVelY = true;
        maxVel.set(5, 5);
        resetAcc = true;
        ellipse = new DVector();
        ellipse.r = r;
        seek = false;
    }
    void show() {
        fill(0, 255, 0);
        noStroke();
        ellipseToScreenPos();
        ellipse(pos.x, pos.y, r*2, r*2);
    }
    void follow(PVector target_, boolean flag) {
        
        if (!seek) {
            // posBefore.set(target_.x + target_.x, target_.y + target_.y);
            posBefore.set(-width * 0.2, 100);
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
}