Player player;
Platforms platforms;
Button button;
Seeker seeker;
Camera camera;
String[] lines;
Slider slider;

void setup() {
    size(1280, 720);
    camera = new Camera(0, 0);
    camera = new Camera(-width * 0.5, -height * 0.5);
    player = new Player(-width * 0.2, 100);
    platforms = new Platforms();
    button = new Button();
    slider = new Slider(width* 0.75, height * 0.25);
    seeker = new Seeker();
    camera.worldTopLeft = new PVector(-width * 0.5, -height * 0.5);
    camera.worldBottomRight = new PVector(width * 1.5, height * 1.5);
    camera.level();
}

void draw() {
    background(0);
    camera.follow(player.centerScreenPos(), true);
    seeker.seek(player.centerWorldPos(), true);
    seeker.update();
    platforms.update();
    player.update();
    collisions();
    platforms.show();
    player.show();
    seeker.show();
    button.show();
    camera.grid(64, 36);
    slider.show();
}