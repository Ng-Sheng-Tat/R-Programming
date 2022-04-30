### String in R
```
x <- 1
y <- "string"
```
**auto printing or explicit printing is possible**
```
print(x)
print(y)
```

**":" operator**
```
x <- 1:20
x
```

**Objects in R**
1. Character
2. Numeric
3. Integer
4. Complex
5. Logical

- *Vector* can only be the same class
  - *ciercion* will occur to convert everything to the same class
- **Explicit Coercion**
  - forcing data type to be changed
  - ``as.logical(variablename)``
  - ``as.numeric(variablename)``
  - ``as.character(variablename)``
- *List* can contain different classes
  - ``x <- list(values)``
- ``vector(class, object value)`` function to create empty vector

**Numbers**
1. ``Inf``
2. ``NaN``
3. specifying ``suffix L`` gives you an integer
4. ``NA`` means nonsensical coercion results

**Attributes of Objects**
1. names, dimnames
2. dimensions (matrices, arrays)
3. class
4. length
5. other user-defined attributes/metadata
- ``attributes()``

**Creating Vectors**
1. ``c()`` function
2. ``vector(types, length=value)`` function

**Matrices**
- ``m <- matrix(values in array, nrow=n, ncol=m)``
- ``dim(m)``
- ``attributes(m)``
- ```
  m <- 1:20
  dim(m) <- c(2,5)
  print(m)
  ```
- rows-binding (``rbind(x, y)``)
- columns-binding (``cbind(x, y)``)

**Factors**
- is used to represent categorical data
- unordered or ordered
- ``lm()`` and ``glm()``
- ``factor(vector, levels=vector in order)``
- ``table(factor)``
- ``unclass(factor)``

**Missing Values**
- ``is.na()``
- ``is.nan()``

**Data Frame**
1. ``read.table()``
2. ``read.csv()``
3. ``data.matrix()``
4. ``row.names``
5. ``data.frame(x=vector, y=vector)``
  - having the attribute of ``nrow`` and ``ncol``

**You can give each element a *Names* default is NULL**
- ``names(variablename) <- vector``

**Interacting with Outside Data**
1. ``file``
2. ``gzfile``
3. ``bzfile``
4. ``url``

**Subsetting**
- (vector) using the ``[]`` operator, by putting inside the condition or indices
- (list) using the ``[[]]`` operator by passing in column name or column indices
- (list) using the ``$`` for extracting column name
- (matrix) using ``[]`` by passing the row and column number starting from 0, adding the parameter of ``drop=FALSE`` means it will return as matrix instead of vector

**Removing NA Values**
``x[!is.na(x)]``

**Matrix Operation**
- ``*``: element-wise multiplication
- ``%*%``: true-matrix multiplication
