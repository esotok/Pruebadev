FROM jenkins/jenkins:lts

# switchs to root user
USER 0

# disabled initial setup
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

# pre install some plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# default user
COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/

# installs Android SDK
ENV ANDROID_HOME /opt/android-sdk
ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools
RUN mkdir -p $ANDROID_HOME && \
    wget "https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip" -P $ANDROID_HOME
RUN unzip $ANDROID_HOME/*.zip -d $ANDROID_HOME && \
    rm $ANDROID_HOME/*.zip
RUN sdkmanager tools platform-tools "platforms;android-27" "build-tools;27.0.3"
COPY licenses /opt/android-sdk/licenses

# switchs to default user
USER ${user}