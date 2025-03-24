# Project Brännö 🚗

> Advanced Computer Vision System for Autonomous Vehicle Navigation

[![Python](https://img.shields.io/badge/Python-3.8%2B-blue)](https://www.python.org/)
[![OpenCV](https://img.shields.io/badge/OpenCV-4.5%2B-green)](https://opencv.org/)
[![Docker](https://img.shields.io/badge/Docker-Enabled-blue)](https://www.docker.com/)
[![YOLOv8](https://img.shields.io/badge/YOLOv8-Integrated-yellow)](https://github.com/ultralytics/ultralytics)

## 📑 Table of Contents

- [Project Brännö 🚗](#project-brännö-)
  - [📑 Table of Contents](#-table-of-contents)
  - [🎯 Overview](#-overview)
  - [🎥 System Demo](#-system-demo)
  - [🏗 Architecture](#-architecture)
    - [Detection Services](#detection-services)
      - [🎨 HSV Module](#-hsv-module)
      - [🤖 Machine Learning Module](#-machine-learning-module)
    - [Algorithmic Services](#algorithmic-services)
      - [📐 Trigonometry Module](#-trigonometry-module)
      - [📊 Linear Regression Module](#-linear-regression-module)
    - [Visualization Services](#visualization-services)
  - [💻 Technical Implementation](#-technical-implementation)
    - [Computer Vision Pipeline](#computer-vision-pipeline)
    - [Machine Learning Integration](#machine-learning-integration)
    - [Data Processing](#data-processing)
  - [📚 Documentation](#-documentation)
  - [🚀 Getting Started](#-getting-started)

## 🎯 Overview

Project Brännö emerged from our team's passion for Cyber Physical Systems, extending beyond the scope of the original [Cyber Physical Systems of Systems](https://github.com/mrjex/Cyber-Physical-Systems-and-Sytems-of-Systems) course. Our team of four students envisioned and implemented an ambitious system that leverages cutting-edge technologies including Docker, OpenCV, and advanced machine learning models.

This project demonstrates a sophisticated approach to autonomous vehicle navigation through computer vision, specifically focusing on real-time cone detection and steering angle calculation. By combining modern architectural patterns with powerful technologies, we've created a scalable and robust solution that exceeds the original course requirements.

## 🎥 System Demo

Watch our system in action:

[![Project Branno Demo](https://img.youtube.com/vi/HuOq2pDhM6Y/maxresdefault.jpg)](https://www.youtube.com/watch?v=HuOq2pDhM6Y)
*Click to watch the full demonstration video*

## 🏗 Architecture

Our architecture follows a hybrid approach, combining pipe-and-filter patterns with service-oriented design principles. The system is divided into three main service categories, each handling specific aspects of the processing pipeline:

![Entire-Architecture](readme-material/architecture/1.%20initial-architecture//1.%20entire-architecture.PNG)
*High-level system architecture overview*

### Detection Services

![Detection-Layer](readme-material/architecture/1.%20initial-architecture/2.%20Layer-1.PNG)
*Detection service layer architecture*

The Detection Services layer processes video input (.mp4 or .rec files) to identify cone positions, implementing two distinct approaches:

#### 🎨 HSV Module
- Color-based detection using HSV color space
- Optimized C++ implementation
- Real-time processing capabilities

#### 🤖 Machine Learning Module
- Powered by YOLOv8 architecture
- Custom-trained on annotated cone datasets
- Integration with Roboflow for data preparation
- Real-time object detection and tracking

### Algorithmic Services

![Algorithmic-Layer](readme-material/architecture/1.%20initial-architecture/3.%20Layer-2.PNG)
*Algorithmic service layer architecture*

This layer calculates steering angles based on detected cone positions using two methodologies:

#### 📐 Trigonometry Module
![Trigonometry-Sketch](readme-material/trigonometry-groundsteering.jpg)
*Geometric approach to steering angle calculation*

#### 📊 Linear Regression Module
- Statistical approach to steering prediction
- Implemented in C++ for performance
- Robust against noise and outliers

### Visualization Services

![Visualization-Layer](readme-material/architecture/1.%20initial-architecture/4.%20Layer-3.PNG)
*Visualization service layer architecture*

Features:
- MongoDB integration for data persistence
- Interactive visualization modes
- Automated graph generation
- Real-time performance monitoring

## 💻 Technical Implementation

### Computer Vision Pipeline
1. Frame extraction from video input
2. Cone detection using selected module
3. Position data extraction and formatting
4. CSV output generation for downstream processing

### Machine Learning Integration
- Custom YOLOv8 model training
- Dataset split: 70% training, 20% validation, 10% testing
- Automated detection output in `runs/detect/predictX`
- Real-time inference capabilities

### Data Processing
- MongoDB for data persistence
- Automated data instance storage
- Interactive debugging capabilities
- Structured output in `/Graphs` directory

## 📚 Documentation

Our development process included comprehensive documentation:

Initial Design:
![Initial-Doc](readme-material/group-documents/1.%20group-document.jpg)
*Initial system design documentation*

Final Implementation:
![Final-Doc1](readme-material/group-documents/2.%20group-document.jpg)
*System configuration and settings*

![Final-Doc2](readme-material/group-documents/3.%20group-document.jpg)
*Detailed implementation specifications*

## 🚀 Getting Started

1. Clone the repository
2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
3. Configure MongoDB connection
4. Run the detection service:
   ```bash
   python detection_service.py --input video.mp4 --module ml
   ```
5. Process results:
   ```bash
   python process_results.py
   ```

---

*Project Brännö is an advanced computer vision system developed by a team of four students at [University Name], demonstrating the practical application of cyber-physical systems in autonomous navigation.*