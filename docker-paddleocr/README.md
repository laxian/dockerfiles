# 基于PaddleOCR进行视频延迟识别

<!-- slide -->

## 说明

基于PaddleOCR，进行推流延迟统计。

将格式良好的视频转换成图片，通过PaddleOCR识别图片内时间戳，计算出延迟并输出

构建前，通过git拉取OCR识别代码，并添加到镜像。
[ocr.sh](https://github.com/laxian/shell/blob/dev/apr/e1/delay-ocr/ocr.sh)

Mac M1 芯片暂不支持

<!-- slide -->

## 使用方法

```Bash
./build.sh
```
