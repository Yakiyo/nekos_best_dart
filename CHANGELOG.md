#### 2.1.5
* Add angry and run endpoints

#### 2.1.3
* Update fetch file method to fetch an entry first then refetch its file content

#### 2.1.2
* Add nod, nom, nope endpoints

#### 2.1.1
* Further refactoring
* Better error handling
    * Create error class and its sub classes
* Major typos on class name fixed
* Handle ratelimiting for search method

#### 2.1.0
* More refactoring code
* Create Client class for all the methods
* Refactor external `fetch` function to internally use `Client.fetch`
* Create search method
* Create fetchFile method
* Create NBBufferResponse class
* Export Classes from the package too
* Rewrite entire examples directory

#### 2.0.0
* Refactor entire code
* Merge `fetch` and `fetchMultiple` to only `fetch` function
* Create `NBResponse` class
* Return list of `NBResponse` in function results
* Modularize code, move utils to separate file

#### 1.0.2
* Fix response objects. Thanks to Thusu for pointing the problems

#### 1.0.1
* Fix readme issues

#### 1.0.0
* Release initial version

