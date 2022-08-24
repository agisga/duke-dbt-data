FROM python:3.8

RUN pip install --upgrade pip==20.3.1

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

# avoids permission issues
RUN useradd -ms /bin/bash alexej
RUN usermod -u 5755 alexej
RUN usermod -G root alexej
# avoids the issue discussed at https://stackoverflow.com/questions/66060487/valueerror-numpy-ndarray-size-changed-may-indicate-binary-incompatibility-exp
RUN pip install --upgrade numpy

WORKDIR /duke-dbt
