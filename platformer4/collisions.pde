void collisions() {
    player.collisionSide = "none";
    for (Platform platform : platforms.platforms_) {
        platform.onTop = false;
        String collisionSide = rectCollision(player, platform);
        if (collisionSide == "bottom") {
            player.collisionSide = collisionSide;
            platform.onTop = true;
        } else if (player.collisionSide != "bottom") player.collisionSide = collisionSide;
    }
}

String rectCollision(Player r1, Platform r2) {
    // if (r1.vel.y < 0) return false;
    float dx = (r1.pos.x+r1.w/2) - (r2.pos.x+r2.w/2);
    float dy = (r1.pos.y+r1.h/2) - (r2.pos.y+r2.h/2);
    float combW = r1.w/2 + r2.w/2;
    float combH = r1.h/2 + r2.h/2;

    if (abs(dx) < combW && abs(dy) < combH) {
        float overlapX = combW - abs(dx);
        float overlapY = combH - abs(dy);
        if (overlapX >= overlapY) {
            if (dy > 0) {
                r1.vel.y = 0;
                r1.pos.y += overlapY;
                return "top";
            } else {
                r1.vel.y = 0;
                r1.pos.y -= overlapY;
                return "bottom";
            }
        } else {
            if (dx > 0) {
                r1.vel.x = 0;
                r1.pos.x += overlapX;
                return "left";
        } else {
            r1.vel.x = 0;
            r1.pos.x -= overlapX;
            return "right";
            }
        }
    }
    return "none";
}