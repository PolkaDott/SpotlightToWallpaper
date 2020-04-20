#include <windows.h>
int main(int argc, char**argv){
    if (argc < 2) return 1;
    SystemParametersInfo(SPI_SETDESKWALLPAPER, 0, argv[1], SPIF_UPDATEINIFILE);
    return 0;
}
