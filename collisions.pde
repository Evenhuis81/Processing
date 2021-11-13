class Collisions {
    void boundaries(Player player_, Vf4d worldSize_) {
        if (player_.pos.y + player_.h > worldSize_.y2) {
            player_.pos.y = worldSize_.y2 - player_.h;
            player_.vel.y = 0;
        } else if (player_.pos.y < worldSize_.y1) {
            player_.pos.y = worldSize_.y1;
            player_.vel.y = 0;
        }
        if (player_.pos.x + player_.w > worldSize_.x2) {
            player_.pos.x = worldSize_.x2 - player_.w;
            player_.vel.x = 0;
        } else if (player_.pos.x < worldSize_.x1) {
            player_.pos.x = worldSize_.x1;
            player_.vel.x = 0;
        }
    }
}