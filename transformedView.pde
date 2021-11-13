TransformedView tv;
Player player;
Collisions collisions;
Seeker seeker;
Slider slider;

void setup() {
    size(1280, 720);
    player = new Player();
    tv = new TransformedView();
    tv.setWorldSize(-width * 0.5, -height * 0.5, width * 1.5, height * 1.5); // topLeft > bottomRight
    collisions = new Collisions();
    seeker = new Seeker();
    slider = new Slider();
}

void draw() {
    background(0);
    tv.resolveWorldBounds();
    // tv.follow(player.pos);
    // seeker.seek(player.pos);
    seeker.follow(player.pos);
    player.update();
    seeker.update();
    collisions.boundaries(player, tv.worldSize);
    player.show();
    seeker.show();
    slider.show();
    tv.drawBounds();
}