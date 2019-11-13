title: ES6的十个特性
date: 2017-09-17 12:14:14
tags: 
    - JavaScript
    - ES6
---

原文出自: [Top 10 ES6 features by example](https://blog.pragmatists.com/top-10-es6-features-by-example-80ac878794bb)

尽管ES6不是什么新鲜事物了，我依然认为有很多开发者对它还不是很熟悉。主要的原因可能是ES6发布后浏览器的支持比较差。ES6已经发布2年多，并且大部分浏览器都支持的不错，即使你或者你的客户没有使用最新版本的浏览器，你也可以利用转换工具(例如 `Babel` )在构建应用过程中将ES6的代码转换为ES5的代码。也就是说你可以领先一步来学习ES6。

在本文中，我会尝试用最简明的方式来介绍最有用的特性。读完本文后，你可以将这些技巧应用在真实的项目中，不要将本文作为一个指南或者文档，我们的目标是鼓励你去深入熟悉ES6。

## 开始吧

### const 和 let 关键字
`const` 用来定义一个常量，`let` 用来定义一个变量。在`JavaScript`中不是有`var`来定义变量吗？是的，可是`var`声明的变量是函数作用域而且会被提升，就是说变量在声明前已经被使用，`let`变量和常量拥有块作用域，声明前是不会被使用。
```javascript
    function f() {
      var x = 1
      let y = 2
      const z = 3
      {
        var x = 100
        let y = 200
        const z = 300
        console.log('x in block scope is', x)
        console.log('y in block scope is', y)
        console.log('z in block scope is', z)
      }
      console.log('x outside of block scope is', x)
      console.log('y outside of block scope is', y)
      console.log('z outside of block scope is', z)
    }
    f()
 ```
 run:
 ```shell    
    x in block scope is 100 
    y in block scope is 200 
    z in block scope is 300 
    x outside of block scope is 100 
    y outside of block scope is 2 
    z outside of block scope is 3 
```
### 数组辅助函数
新的辅助函数出现，使得数组在很多情况下都可以很好的工作，多少次你执行过滤这样的逻辑，检查所有的元素是否符合条件或者元素转换，可能很频繁，现在有了很好的语言特性是你更好的完成工作，在我看来，是最有价值的函数。
    
#### forEach

循环数据内部元素，执行提供的函数，将元素作为参数传入
```javascript
    var colors = ['red', 'green', 'blue']

    function print(val) {
      console.log(val)
    }

    colors.forEach(print)
```
run:
```shell
    red 
    green 
    blue
```
#### map

创建一个新数组包含同样的元素个数，只是输出元素通过函数创建，可以转换数组的每个元素到其他的。
```javascript
    var colors = ['red', 'green', 'blue']

    function capitalize(val) {
        return val.toUpperCase()
    }

    var capitalizedColors = colors.map(capitalize)

    console.log(capitalizedColors)
```
run:
```shell
    ["RED","GREEN","BLUE"] 
```
#### filter
创建一个新数组包含原始数组的子集，结果是哪些通过传入函数测试的元素，通常返回true 或者 false
```javascript
    var values = [1, 60, 34, 30, 20, 5]

    function lessThan20(val) {
        return val < 20
    }

    var valuesLessThan20 = values.filter(lessThan20)

    console.log(valuesLessThan20)
```
run:
```shell
    [1,5]
```
#### find
查找第一个通过传入函数测试的元素，通过传入函数返回true或者false
```javascript
    var people = [
      {name: 'Jack', age: 50},
      {name: 'Michael', age: 9}, 
      {name: 'John', age: 40}, 
      {name: 'Ann', age: 19}, 
      {name: 'Elisabeth', age: 16}
    ]

    function teenager(person) {
        return person.age > 10 && person.age < 20
    }

    var firstTeenager = people.find(teenager)

    console.log('First found teenager:', firstTeenager.name)
```
run:
```shell
    First found teenager: Ann 
```
#### every
检测数组中的每个元素是否通过函数测试
```javascript
    var people = [
      {name: 'Jack', age: 50},
      {name: 'Michael', age: 9}, 
      {name: 'John', age: 40}, 
      {name: 'Ann', age: 19}, 
      {name: 'Elisabeth', age: 16}
    ]

    function teenager(person) {
        return person.age > 10 && person.age < 20
    }

    var firstTeenager = people.find(teenager)

    console.log('First found teenager:', firstTeenager.name)
```
run:
```shell
    Everyone is teenager:  false 
```
#### some
检测数组中的任意元素是否通过函数测试
```javascript
    var people = [
        {name: 'Jack', age: 50},
        {name: 'Michael', age: 9}, 
        {name: 'John', age: 40}, 
        {name: 'Ann', age: 19}, 
        {name: 'Elisabeth', age: 16}
    ]

    function teenager(person) {
        return person.age > 10 && person.age < 20
    }

    var thereAreTeenagers = people.some(teenager)

    console.log('There are teenagers:', thereAreTeenagers)
```
run:
```shell 
    There are teenagers: true 
```
#### reduce
函数传入第一个参数累加，数组中每个元素从左到右，减少到一个值，初始累加值作为第二个参数传入
```javascript
    var array = [1, 2, 3, 4]

    function sum(acc, value) {
      return acc + value
    }

    function product(acc, value) {
      return acc * value
    }

    var sumOfArrayElements = array.reduce(sum, 0)
    var productOfArrayElements = array.reduce(product, 1)

    console.log('Sum of', array, 'is', sumOfArrayElements)
    console.log('Product of', array, 'is', productOfArrayElements)
```
run:
```shell 
    Sum of [1,2,3,4] is 10 
    Product of [1,2,3,4] is 24  
```
### 函数箭头
很多简单的函数需要写很多样板代码，如何改善呢？试试箭头函数吧。
```javascript
    var array = [1, 2, 3, 4]

    const sum = (acc, value) => acc + value
    const product = (acc, value) => acc * value

    var sumOfArrayElements = array.reduce(sum, 0)
    var productOfArrayElements = array.reduce(product, 1)
```
箭头函数也可以作为内联，真正的简洁代码
```javascript
    var array = [1, 2, 3, 4]

    var sumOfArrayElements = array.reduce((acc, value) => acc + value, 0)
    var productOfArrayElements = array.reduce((acc, value) => acc * value, 1)
```
箭头函数也可以写的复杂
```javascript
    var array = [1, 2, 3, 4]

    const sum = (acc, value) => {
      const result = acc + value
      console.log(acc, ' plus ', value, ' is ', result)
      return result
    }

    var sumOfArrayElements = array.reduce(sum, 0)
```
### 类
当java开发者转向js项目时都不想缺少类，不喜欢显式继承，比如在java语言中，使用原型继承代替魔法代码，尽管有些js开发者反对，但是类依然出现在ES6中，他们没有改变继承的概念，依然使用原型继承的语言糖。
```javascript
    class Point {
        constructor(x, y) {
            this.x = x
            this.y = y
        }

        toString() {
            return '[X=' + this.x + ', Y=' + this.y + ']'
        }
    }

    class ColorPoint extends Point {
        static default() {
            return new ColorPoint(0, 0, 'black')
        }

        constructor(x, y, color) {
            super(x, y)
            this.color = color
        }

        toString() {
            return '[X=' + this.x + ', Y=' + this.y + ', color=' + this.color + ']'
        }
    }

    console.log('The first point is ' + new Point(2, 10))
    console.log('The second point is ' + new ColorPoint(2, 10, 'green'))
    console.log('The default color point is ' + ColorPoint.default())
```
run:
```shell 
    The first point is [X=2, Y=10] 
    The second point is [X=2, Y=10, color=green] 
    The default color point is [X=0, Y=0, color=black] 
```
### 改善对象实现
对象实现得到改善，现在变得更容易

* 定义变量字段赋相同的名字
* 定义函数
* 定义动态属性

```javascript
    const color = 'red'
    const point = {
      x: 5,
      y: 10,
      color,
      toString() {
        return 'X=' + this.x + ', Y=' + this.y + ', color=' + this.color
      },
      [ 'prop_' + 42 ]: 42
    }

    console.log('The point is ' + point)
    console.log('The dynamic property is ' + point.prop_42)
```
run:
```shell 
    The point is X=5, Y=10, color=red 
    The dynamic property is 42 
```
### 模板字符串
我想大部分人都不喜欢写一大串字符串或者拼接变量，每个人也都不想去读他们，幸运的是在ES6中提供了一个非常易用的带占位符的字符串模板变量。
```javascript
    function hello(firstName, lastName) {
      return `Good morning ${firstName} ${lastName}! 
    How are you?`
    }

    console.log(hello('Jan', 'Kowalski'))
```
run:
```shell 
    Good morning Jan Kowalski! 
    How are you? 
```
请注意，我们可以写多行文本，很重要的是用倒引号取代了撇号
### 函数默认参数
不喜欢为函数提供所有可能的参数，那就用默认的
```javascript
    function sort(arr = [], direction = 'ascending') {
      console.log('I\'m going to sort the array', arr, direction)
    }

    sort([1, 2, 3])
    sort([1, 2, 3], 'descending')
```
run:
```shell 
    I'm going to sort the array [1,2,3] ascending 
    I'm going to sort the array [1,2,3] descending 
```
### rest 和 spread 操作符

#### spread
能够扩展数组或者对象内容作为单一参数
案例--数组浅拷贝
```javascript
    var array = ['red', 'blue', 'green']
    var copyOfArray = [...array]

    console.log('Copy of', array, 'is', copyOfArray)
    console.log('Are', array, 'and', copyOfArray, 'same?', array === copyOfArray)
```
run:
```shell
    Copy of ["red","blue","green"] is ["red","blue","green"] 
    Are ["red","blue","green"] and ["red","blue","green"] same? false 
```
案例--合并数组
```javascript
    var defaultColors = ['red', 'blue', 'green']
    var userDefinedColors = ['yellow', 'orange']

    var mergedColors = [...defaultColors, ...userDefinedColors]

    console.log('Merged colors', mergedColors)
```
run:
```shell
    Merged colors ["red","blue","green","yellow","orange"] 
```
#### rest
是不是喜欢绑定一些参数到变量上，并且剩下的参数会作为独立的变量，现在你可以容易做到
```javascript
    function printColors(first, second, third, ...others) {
      console.log('Top three colors are ' + first + ', ' + second + ' and ' + third + '. Others are: ' + others)
    }
    printColors('yellow', 'blue', 'orange', 'white', 'black')
```
run:
```shell
    Top three colors are yellow, blue and orange. Others are: white,black 
```
### 解构
#### 数组
可以扩展请求元素赋值给变量
```javascript
    function printFirstAndSecondElement([first, second]) {
        console.log('First element is ' + first + ', second is ' + second)
    }

    function printSecondAndFourthElement([, second, , fourth]) {
        console.log('Second element is ' + second + ', fourth is ' + fourth)
    }

    var array = [1, 2, 3, 4, 5]

    printFirstAndSecondElement(array)
    printSecondAndFourthElement(array)
```
run:
```shell
    First element is 1, second is 2 
    Second element is 2, fourth is 4 
```
#### 对象
可以扩展请求对象的属性复制给相同的属性变量
```javascript
    function printBasicInfo({firstName, secondName, profession}) {
        console.log(firstName + ' ' + secondName + ' - ' + profession)
    }

    var person = {
      firstName: 'John',
      secondName: 'Smith',
      age: 33,
      children: 3,
      profession: 'teacher'
    }

    printBasicInfo(person)
```
run:
```shell
    John Smith - teacher 
```
### Promises
Promise使你可以获取延迟任务或运行时间较长任务的结果，Promise有两个渠道，第一是结果，第二是潜在错误，为了获取结果，你需要提供一个函数作为`then`函数的参数，为了处理错误，你需要提供一个函数作为`catch`函数的参数
请你注意案例每次的输结果可能不相同，因为随机函数调用。
```javascript
    function asyncFunc() {
        return new Promise((resolve, reject) => {
            setTimeout(() => {
              const result = Math.random();
              result > 0.5 ? resolve(result) : reject('Oppps....I cannot calculate')
            }, 1)
        });
    }

    for (let i=0; i<10; i++) {
        asyncFunc()
            .then(result => console.log('Result is: ' + result))
            .catch(result => console.log('Error: ' + result))
    }
```
run:
```shell
    Result is: 0.7930997430022211 
    Error: Oppps....I cannot calculate 
    Result is: 0.6412258210597288 
    Result is: 0.7890325910244533 
    Error: Oppps....I cannot calculate 
    Error: Oppps....I cannot calculate 
    Result is: 0.8619834683310168 
    Error: Oppps....I cannot calculate 
    Error: Oppps....I cannot calculate 
    Result is: 0.8258410427354488 
```
## 总结
我希望你能够喜欢本文，如果你需要更多的实践，你可以在[https://es6console.com/](https://es6console.com/)进行学习，如果你需要更多帮助，请前往
- [https://github.com/lukehoban/es6features](https://github.com/lukehoban/es6features)
- [http://exploringjs.com/es6/](http://exploringjs.com/es6/)
