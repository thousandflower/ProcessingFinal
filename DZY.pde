PImage userImage;
int spacing = 10;
float siz = 1;


void setup() {
  size(1000, 1000);
  background(255);
  cp5 = new ControlP5(this);
  selectUserImage();
  UI();
  // 添加调试语句
  println("cp5: " + cp5);
  println("spacing controller: " + cp5.getController("spacing"));
  println("siz controller: " + cp5.getController("siz"));
}

void draw() {
  if (userImage == null) {
    return;
  }

  spacing = (int) cp5.getController("spacing").getValue();
  siz = cp5.getController("siz").getValue();
  fill(255);
  rect(0, 0, width, height);

  for (int x = spacing; x < userImage.width; x += spacing) {
    for (int y = spacing; y < userImage.height; y += spacing) {
      color c = userImage.get(x, y);
      fill(c);
      noStroke();

      float r = spacing * siz;
      ellipse(x, y, r, r);
    }
  }
}

void selectUserImage() {
  selectInput("选择照片", "imageSelected");
}

void imageSelected(File selection) {
  if (selection == null) {
    println("未选择照片");
  } else {
    userImage = loadImage(selection.getAbsolutePath());
    if (userImage != null) {
      userImage.resize(width, 0);
    }
  }
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    save("front.png");
  }
}
