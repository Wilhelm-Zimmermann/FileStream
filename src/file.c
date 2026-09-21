#include "file.h"
#include <math.h>
#include <string.h>

FileStream* read_file(char* file_path)
{
	FILE* file = fopen(file_path, "rb");
	if (file == NULL)
        {
        	fprintf(stderr, "Failed to open the file\n");
	        return (FileStream*)malloc(1 * sizeof(FileStream));
    	}
	
	fseek(file, 0, SEEK_END);
	int fileSize = ftell(file);
	fseek(file, 0, SEEK_SET);

	uint8_t* buffer = calloc(fileSize, sizeof(uint8_t));
	fread(buffer, 1, fileSize, file);
	FileStream* fs = calloc(1, sizeof(FileStream));
	fs->buffer = buffer;
	fs->fileSize = fileSize;
	return fs;
}

void divide_fileChunks(int totalFileSize, int chunksAmount, uint8_t* fileBytes, const char* fileExt, char* fileToSolve)
{
	for(int i = 0; i < chunksAmount; i ++)
	{
		if(fileToSolve == NULL)
		{
			fileToSolve = calloc(50, sizeof(char));
			snprintf(fileToSolve, 50, "./file_part_%d%s", i, fileExt);
		}
		
		FILE *filePointer = fopen(fileToSolve,"wb");

		if (filePointer == NULL)
    		{
        		fprintf(stderr, "Error: Could not open the file '%s'.\n", fileToSolve);
	        	exit(1);
		}

		int bufferSize = i + 1 == chunksAmount ? ceil(totalFileSize / chunksAmount) : totalFileSize / chunksAmount;
		for(int j = 0; j < bufferSize; j++)
		{
			int fileBytePointer = (bufferSize * i) + j;
			uint8_t byteToWrite[] = { fileBytes[fileBytePointer] };
			fwrite(byteToWrite, 1, 1, filePointer);
		}
		fclose(filePointer);
		fileToSolve = NULL;
	}
}

const char *get_file_extension(const char *filename) {
    const char *dot = strrchr(filename, '.');
    
    if (!dot || dot == filename) {
        return "";
    }
    
    if (strchr(dot, '/') || strchr(dot, '\\')) {
        return "";
    }
    
    return dot; 
}