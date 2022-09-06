FROM python:3.9 AS build
ARG dev

ADD delay-ocr /opt/
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN apt-get update && apt-get install -y libgl1 vim ffmpeg
# install paddle 2.3.2 cpu-openblas-noavx
RUN pip install paddlepaddle
RUN if [[ ! -z "$dev" ]]; then \
      pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip setuptools wheel; \
      pip install -i https://pypi.tuna.tsinghua.edu.cn/simple paddleocr==2.6.0; \
    else \
      pip install --upgrade pip setuptools wheel; \
      pip install paddleocr==2.6.0; \
    fi

CMD paddleocr -h