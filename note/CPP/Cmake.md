+ 展示编译过程中，更详细的命令行指令

​	`cmake .. -DCMAKE_VERBOSE_MAKEFILE=ON`

+ 核心路径变量

|             变量名             |            作用域            |                             描述                             |
| :----------------------------: | :--------------------------: | :----------------------------------------------------------: |
|     **`CMAKE_SOURCE_DIR`**     |       全局（整个项目）       |      **项目根目录**（顶层 `CMakeLists.txt` 所在目录）。      |
|     **`CMAKE_BINARY_DIR`**     |       全局（整个项目）       | **构建根目录**（`cmake` 命令运行的目录，通常是 `build/`）。  |
| **`CMAKE_CURRENT_SOURCE_DIR`** | 当前处理的 `CMakeLists.txt`  |   **当前 CMakeLists.txt 所在的目录**（子模块的源码路径）。   |
| **`CMAKE_CURRENT_BINARY_DIR`** | 当前处理的 `CMakeLists.txt`  | **当前 CMakeLists.txt 对应的构建目录**（`build/` 下的对应子目录）。 |
|    **`PROJECT_SOURCE_DIR`**    | 当前项目（`project()` 定义） | **当前 `project()` 所在的源码目录**（可能和 `CMAKE_SOURCE_DIR` 不同）。 |
|    **`PROJECT_BINARY_DIR`**    | 当前项目（`project()` 定义） | **当前 `project()` 对应的构建目录**（`build/` 下的项目子目录）。 |

