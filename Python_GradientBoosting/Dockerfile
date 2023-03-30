FROM ssayjcrepo.azurecr.io/viya-4-x64_oci_linux_2-docker/sas-decisions-runtime-base:1.46.31-20230314.1678821270125
LABEL model container image
USER root
RUN chown sas:sas /modules
USER sas
ENV SAS_SCR_APP_PATH=/python_gradientboosting
COPY --chown=sas:sas unzipped/ /modules/
COPY --chown=sas:sas manifest/ /manifest/
ENV LD_LIBRARY_PATH=/opt/scr/viya/home/SASFoundation/utilities/bin:/opt/scr/viya/home/SASFoundation/sasexe
