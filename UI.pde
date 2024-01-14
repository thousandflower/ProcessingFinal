import controlP5.*;
ControlP5 cp5; 

void UI() {
  int sliderWidth = 300; // 控制条宽度
  int sliderHeight = 30; // 控制条高度

  // 添加这两行代码，分别为 spacing 和 siz 控制器赋值
  Slider spacingSlider = cp5.addSlider("spacing")
    .setRange(5, 50)
    .setValue(10)
    .setSize(sliderWidth, sliderHeight);

  Slider sizSlider = cp5.addSlider("siz")
    .setRange(0.2, 2)
    .setValue(1)
    .setSize(sliderWidth, sliderHeight);

  // 打印控制器信息，以确认它们是否被正确创建
  println("spacing controller: " + spacingSlider);
  println("siz controller: " + sizSlider);
}

void selectImage(int theValue) {
  if (theValue == 1) {
    selectInput("Select an image file", "imageSelected");
  }
}
