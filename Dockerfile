FROM quay.io/nyulibraries/primo-explore-devenv:latest

ENV VIEW CENTRAL_PACKAGE
ENV DEVENV_PATH /app/
ENV CUSTOM_PACKAGE_PATH /app/primo-explore/custom/
ENV CUSTOM_VIEW_PATH ${CUSTOM_PACKAGE_PATH}/${VIEW}

WORKDIR ${CUSTOM_VIEW_PATH}

ADD . .

RUN yarn install --prod

WORKDIR ${DEVENV_PATH}

EXPOSE 8004 3001

RUN VIEW=${VIEW} yarn build

CMD yarn start --host=0.0.0.0