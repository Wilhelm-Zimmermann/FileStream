#include "file.h"
#include <string.h>

// This will be a stream program, i can get a large file and cut it onto small streams to upload it on the future
// Also it can do the reverse, I should be able to read the streams of this file
// Now i will only work with text, after this I will implement more types of files, thinking more on it, every single file at the end will be a lot of bytes ordered
// So the only thing that I need is to interpret it, if it is txt file I must read a text, if it is a mp4 file I must show a video, I will not implement a video right now
// But I would like to make a video player on the future, and I think that it is a good idea
//
// For now, the objective is, receive a file and ask for the user in how many parts he wants to break it. How will I do it?
// 	- Mount the logic to get the file size
// 	- Divide it into the pieces that the user sent
// 	- Break it and create other files based on it. If it was a backend I should break it on parts that the backend want and send more information like the checksum and etc.

int main(int argc, char** args)
{
	if (argc < 3)
	{	
        	printf("Usage: %s <file path + extension name> <pieces to divide>\n", args[0]);
        	return 1;
	}

	if(strcmp(args[1], "-c") == 0)
	{
		int lastPointerIndex = 0;
		int totalFileSize = 0;
		uint8_t* buffer = calloc(10, sizeof(uint8_t));

		for(int i = 2; i < argc; i++)
		{
			FileStream* file_part = read_file(args[i]);
			totalFileSize += file_part->fileSize;

			buffer = realloc(buffer, totalFileSize);
			for(int j = 0; j < file_part->fileSize; j++)
			{
				buffer[j + lastPointerIndex] = file_part->buffer[j];			
			}
			lastPointerIndex = totalFileSize;
		}
		const char* fileExt = get_file_extension(args[2]);
		char fullFileName[50];
		snprintf(fullFileName, sizeof(fullFileName), "./reconditioned%s", fileExt);
		
		divide_fileChunks(totalFileSize, 1, buffer, fileExt, fullFileName);
		return 0;
	}

	FileStream* fs = read_file(args[1]);
	int chunksAmount = atoi(args[2]);
	const char* fileExt = get_file_extension(args[1]);
	divide_fileChunks(fs->fileSize, chunksAmount, fs->buffer, fileExt, NULL);
	free(fs->buffer);
	free(fs);
	return 0;
}
