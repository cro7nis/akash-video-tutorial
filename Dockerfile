FROM pytorch/pytorch:2.1.0-cuda12.1-cudnn8-runtime

ENV GRADIO_SERVER_PORT=7860
ENV GRADIO_SERVER_NAME="0.0.0.0"

WORKDIR /opt/app
RUN pip install poetry
COPY  pyproject.toml pyproject.toml
RUN  poetry config virtualenvs.create false \
    && poetry install --no-root --no-interaction

# Copy nesessary files to docker
COPY app.py app.py

ENTRYPOINT ["python", "app.py"]
