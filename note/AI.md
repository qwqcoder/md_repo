# Pytorch 入门

## 1. 张量操作

### 1.1 创建张量

- **`torch.tensor(data)`**：从数据（如列表或 NumPy 数组）创建张量。

  ```python
  import torch
  tensor = torch.tensor([1, 2, 3])
  print(tensor)
  ```

- **`torch.randn(\*sizes)`**：生成符合标准正态分布的随机张量。

  ```python
  randn_tensor = torch.randn(2, 3)
  print(randn_tensor)
  ```

- **`torch.zeros(\*sizes)`**：生成全零张量。

  ```python
  zeros_tensor = torch.zeros(2, 3)
  print(zeros_tensor)
  ```

### 1.2 张量形状和维度变换

- **`view(\*shape)`**：改变张量的形状。

  ```python
  tensor = torch.tensor([[1, 2, 3], [4, 5, 6]])
  reshaped_tensor = tensor.view(-1, 2)
  print(reshaped_tensor)
  ```

- **`permute(\*dims)`**：重新排列张量的维度。

  ```python
  permuted_tensor = tensor.permute(1, 0)
  print(permuted_tensor)
  ```

- **`unsqueeze(dim)`**：增加张量的维度。

  ```python
  unsqueezed_tensor = tensor.unsqueeze(0)
  print(unsqueezed_tensor.shape)
  ```

- **`squeeze(dim)`**：去除张量中维度为1的维度。

  ```python
  squeezed_tensor = unsqueezed_tensor.squeeze(0)
  print(squeezed_tensor.shape)
  ```

### 1.3 张量连接和分割

- **`torch.cat(tensors, dim)`**：沿指定维度连接张量。

  ```python
  tensor1 = torch.tensor([[1, 2], [3, 4]])
  tensor2 = torch.tensor([[5, 6], [7, 8]])
  concatenated_tensor = torch.cat((tensor1, tensor2), dim=0)
  print(concatenated_tensor)
  ```

- **`torch.stack(tensors, dim)`**：沿新维度连接张量。

  ```python
  stacked_tensor = torch.stack((tensor1, tensor2), dim=0)
  print(stacked_tensor)
  ```

### 1.4 梯度管理

- **`tensor.requires_grad_()`**：设置张量是否需要计算梯度。

  ```python
  tensor = torch.tensor([1.0, 2.0, 3.0])
  tensor.requires_grad_()
  print(tensor.requires_grad)
  ```

- **`tensor.detach()`**：返回一个从当前计算图中分离的新张量。

  ```python
  detached_tensor = tensor.detach()
  print(detached_tensor.requires_grad)
  ```

- **`with torch.no_grad()`**：临时禁用梯度计算。

  ```python
  with torch.no_grad():
      print(tensor.requires_grad)
  ```

## 2. 神经网络构建和训练

### 2.1 激活函数

- **`nn.ReLU()`**：线性整流函数。

  ```python
  import torch.nn as nn
  relu = nn.ReLU()
  input_tensor = torch.tensor([-1.0, 0.0, 1.0, 2.0])
  output_tensor = relu(input_tensor)
  print(output_tensor)
  ```

- **`nn.Sigmoid()`**：S型函数。

  ```python
  sigmoid = nn.Sigmoid()
  output_tensor = sigmoid(input_tensor)
  print(output_tensor)
  ```

### 2.2 损失函数

- **`nn.MSELoss()`**：均方误差损失。

  ```python
  criterion = nn.MSELoss()
  inputs = torch.tensor([[1.0, 2.0], [2.0, 3.0]])
  targets = torch.tensor([[2.0], [4.0]])
  outputs = torch.tensor([[1.5, 2.5], [2.5, 3.5]])
  loss = criterion(outputs, targets)
  print(loss.item())
  ```

- **`nn.CrossEntropyLoss()`**：交叉熵损失。

  ```python
  criterion = nn.CrossEntropyLoss()
  inputs = torch.tensor([[0.1, 0.2, 0.7]])
  targets = torch.tensor([2])
  loss = criterion(inputs, targets)
  print(loss.item())
  ```

### 2.3 优化器

- **`torch.optim.SGD()`**：随机梯度下降优化器。

  ```python
  import torch.optim as optim
  model = nn.Linear(2, 1)
  optimizer = optim.SGD(model.parameters(), lr=0.01)
  ```

- **`torch.optim.Adam()`**：Adam优化器。

  ```python
  optimizer = optim.Adam(model.parameters(), lr=0.001)
  ```

### 2.4 训练过程

- **`model.train()`** 和 **`model.eval()`**：切换模型的训练模式和评估模式。

  ```python
  model.train()
  outputs = model(inputs)
  loss = criterion(outputs, targets)
  optimizer.zero_grad()
  loss.backward()
  optimizer.step()
  ```

## 3. 数据加载和预处理

### 3.1 数据加载

- **`torch.utils.data.DataLoader`**：加载数据集。

  ```python
  from torch.utils.data import DataLoader
  from torchvision.datasets import CIFAR10
  train_loader = DataLoader(CIFAR10(root='./data', train=True, download=True), batch_size=32, shuffle=True)
  ```

### 3.2 数据预处理

- **`torchvision.transforms`**：对图像数据进行预处理。

  ```python
  from torchvision import transforms
  transform = transforms.Compose([transforms.ToTensor(), transforms.Normalize((0.5,), (0.5,))])
  ```

## 4. 其他常用功能

### 4.1 设备管理

- **`torch.device()`**：指定张量或模型所在的设备。

  ```python
  device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
  tensor = torch.tensor([1.0, 2.0, 3.0], device=device)
  ```

- **`torch.cuda.is_available()`**：检查 CUDA 是否可用。

  ```python
  print(torch.cuda.is_available())
  ```

### 4.2 模型保存和加载

- **`torch.save()`** 和 **`torch.load()`**：保存和加载模型参数。

  ```python
  torch.save(model.state_dict(), 'model.pth')
  model.load_state_dict(torch.load('model.pth'))
  ```

------





# 激活函数

![](//dlink.host/wx2.sinaimg.cn/large/006JEQfJly8hy1xsblh6aj30ha0araai.jpg)



# 梯度下降

+ 计算 w 的梯度（导数）

$$
\nabla w ={f(w+0.0001)-f(w-0.0001)}\over{2*0.0001}
$$

+ 更新 w

$$
w = w - \alpha \nabla w
$$





# 反向传播

![](https://dlink.host/wx4.sinaimg.cn/large/006JEQfJly8hynwm94z7hj30lq0jd759.jpg)

