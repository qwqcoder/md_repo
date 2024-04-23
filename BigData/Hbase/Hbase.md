# Hbase基础

## **版本数**

在HBase中，列族（Column Family）的版本数指的是存储在特定列族下的每个单元格（Cell）的版本的数量。版本数允许你在同一行和列族中存储多个时间戳不同的值，以便进行时间序列数据的记录和查询。这允许你在HBase中存储历史数据，以便随时访问先前的版本。

列族的版本数是可配置的，通常在创建表或修改表结构时进行设置。你可以为每个列族指定不同的版本数，以满足特定的应用需求。

**以下是一些关于列族版本数的重要概念：**

1. **默认版本数**：如果不明确指定列族的版本数，则HBase会使用默认版本数，默认情况下，HBase会存储最新版本的数据。这意味着如果你不指定版本数，只会保留最新的数据。

2. **指定版本数**：你可以在创建表或修改表时为列族指定版本数。例如，你可以为列族指定3个版本，这将允许你存储和检索最近的三个版本的数据。

3. **时间戳**：每个版本都有与之关联的时间戳，用于标识版本的创建时间。你可以指定要检索的版本的时间戳范围。

4. **删除旧版本**：如果不再需要旧版本的数据，你可以通过HBase的自动垃圾回收机制或手动删除旧版本，以释放存储空间。

版本数的选择取决于你的数据访问需求。如果需要维护历史数据并支持时间序列查询，可以选择适当的版本数。但请注意，较大的版本数将占用更多的存储空间，因此需要根据数据大小和性能需求来进行权衡。



# Hbase Shell

+ HBase是一个分布式NoSQL数据库，通常使用HBase Shell或HBase客户端API进行编程。以下是一些常见的HBase编程语句和操作：

**HBase Shell 命令**：

1. **创建表**：
   
   ```shell
   create 'mytable', 'cf1', 'cf2'   # 创建表'mytable'，指定列族'cf1'和'cf2'
```
   
   >当你创建表时，你只需指定要创建的列族的名称，而不需要明确指定列。
   
2. **插入数据**：
   
   ```shell
   put 'mytable', 'row1', 'cf1:col1', 'value1'   # 插入数据到指定行、列族和列
```
   
3. **获取数据**：
   
   ```shell
   get 'mytable', 'row1'   # 获取指定行的数据
```
   
4. **扫描表**：
   
   ```shell
   scan 'mytable'   # 扫描整个表
```
   
5. **删除数据**：
   
   ```shell
   delete 'mytable', 'row1', 'cf1:col1'   # 删除指定行、列族和列的数据
```
   
6. **删除表**：
   ```shell
   disable 'mytable'   # 禁用表
   drop 'mytable'      # 删除表
   ```

7. **列族操作**：
   
   ```shell
   alter 'mytable', {NAME => 'cf1', VERSIONS => 3}   # 修改列族'cf1'的版本数
   ```

# **HBase  API**

使用Java编程进行HBase操作时，你可以使用HBase提供的Java客户端API，以下是一些示例：

```java
// 创建HBase Configuration对象
Configuration config = HBaseConfiguration.create();

// 创建HBase连接
Connection connection = ConnectionFactory.createConnection(config);

// 获取表
TableName tableName = TableName.valueOf("mytable");
Table table = connection.getTable(tableName);

// 插入数据
Put put = new Put(Bytes.toBytes("row1"));
put.addColumn(Bytes.toBytes("cf1"), Bytes.toBytes("col1"), Bytes.toBytes("value1"));
table.put(put);

// 获取数据
Get get = new Get(Bytes.toBytes("row1"));
Result result = table.get(get);

// 扫描表
Scan scan = new Scan();
ResultScanner scanner = table.getScanner(scan);
for (Result row : scanner) {
    // 处理每一行的数据
}

// 删除数据
Delete delete = new Delete(Bytes.toBytes("row1"));
delete.addColumn(Bytes.toBytes("cf1"), Bytes.toBytes("col1"));
table.delete(delete);

// 关闭连接
table.close();
connection.close();
```

这些是HBase的基本编程语句和操作，可以用来创建、插入、查询和删除数据，以及管理表和列族。根据具体需求，可以使用更多的高级功能和过滤器来执行复杂的操作。