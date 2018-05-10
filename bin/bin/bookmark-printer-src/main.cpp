#include <cstdlib>
#include <fstream>
#include <iostream>
#include <sstream>
#include <string>

int main() {
  const std::string BOOKMARKS_FILE =
      std::string(std::getenv("HOME")) + "/doc/personal/bookmarks";

  std::fstream bmFile(BOOKMARKS_FILE);
  if (!bmFile.is_open()) {
    std::cout << "Failed to open " << BOOKMARKS_FILE << std::endl;
  }

  std::string line;
  constexpr int MAX_LEN = 30;

  std::stringstream padBufStream;
  for (int i = 0; i < MAX_LEN; i++) {
    padBufStream << ' ';
  }
  std::string padBuf = padBufStream.str();

  while (!bmFile.eof()) {
    std::getline(bmFile, line);

    // Blank or comment
    if (line.size() == 0 || line[0] == '#') {
      continue;
    }

    int pos = line.find('\t');
    if (pos == std::string::npos) {
      std::cout << "Invalid entry, no TAB found" << std::endl;
      return 1;
    }

    std::string title = line.substr(0, pos);
    std::string url = line.substr(pos + 1, line.size());

    std::string clippedTitle;
    if (title.size() > MAX_LEN) {
      clippedTitle = title.substr(0, MAX_LEN);
    } else {
      clippedTitle = title;
    }

    std::string thisPad;
    int thisPadSize = MAX_LEN - title.size();
    if (thisPadSize > 0) {
      thisPad = padBuf.substr(0, thisPadSize);
    }

    std::cout << clippedTitle << thisPad << "\t\x1b[36m" << url << "\x1b[m"
              << std::endl;
  }
}
