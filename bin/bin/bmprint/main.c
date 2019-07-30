#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int main() {
    char bm_path[512] = {};
    snprintf(bm_path, sizeof(bm_path), "%s%s", getenv("HOME"), "/doc/personal/bookmarks");

    FILE *bm_file = fopen(bm_path, "r");

    char line[512] = {};
    
}