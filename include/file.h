#pragma once
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

typedef struct
{
	uint8_t* buffer;
	int fileSize;
} FileStream;


FileStream* read_file(char* file_path);
void divide_fileChunks(int totalFileSize, int chunksAmount, uint8_t* fileBytes, const char* fileExt, char* fileToSolve);
const char *get_file_extension(const char *filename);