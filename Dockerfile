FROM node:boron

RUN npm install -g @angular/cli

RUN ng new tryGetSetProj 
WORKDIR /tryGetSetProj
VOLUME [ "/tryGetSetProj" ]


CMD [ "ng", "version" ]