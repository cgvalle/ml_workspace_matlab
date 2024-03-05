FROM mathworks/matlab:r2022b as matlab
FROM mltooling/ml-workspace:latest

ENV MATLAB_VERSION=R2022b

COPY --from=matlab /opt/matlab/$MATLAB_VERSION /opt/matlab/$MATLAB_VERSION

COPY matlab.ico /root
#COPY bg_ml_foundation.png  /root/resources/branding/bg_ml_foundation.png

RUN touch /usr/share/applications/matlab.desktop && \
    echo "[Desktop Entry]" >> /usr/share/applications/matlab.desktop && \
    echo "Version=1.0" >> /usr/share/applications/matlab.desktop && \
    echo "Type=Application" >> /usr/share/applications/matlab.desktop && \
    echo "Terminal=false" >> /usr/share/applications/matlab.desktop && \
    echo "Exec=/opt/matlab/$MATLAB_VERSION/bin/matlab -desktop" >> /usr/share/applications/matlab.desktop && \
    echo "Name=MATLAB $MATLAB_VERSION" >> /usr/share/applications/matlab.desktop && \
    echo "Icon=/root/matlab.ico" >> /usr/share/applications/matlab.desktop && \
    echo "Comment=MATLAB" >> /usr/share/applications/matlab.desktop && \
    echo "Categories=Development" >> /usr/share/applications/matlab.desktop && \
    chmod +x /usr/share/applications/matlab.desktop

