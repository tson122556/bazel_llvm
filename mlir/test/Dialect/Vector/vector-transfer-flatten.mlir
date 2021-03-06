// RUN: mlir-opt %s -test-vector-transfer-flatten-patterns -split-input-file | FileCheck %s

func @transfer_read_flattenable_with_offset(
      %arg : memref<5x4x3x2xi8, offset:?, strides:[24, 6, 2, 1]>) -> vector<5x4x3x2xi8> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0 : i8
    %v = vector.transfer_read %arg[%c0, %c0, %c0, %c0], %cst : 
      memref<5x4x3x2xi8, offset:?, strides:[24, 6, 2, 1]>, vector<5x4x3x2xi8>
    return %v : vector<5x4x3x2xi8>
}

// CHECK-LABEL: func @transfer_read_flattenable_with_offset
// CHECK-SAME:      %[[ARG:[0-9a-zA-Z]+]]: memref<5x4x3x2xi8
// CHECK:         %[[COLLAPSED:.+]] = memref.collapse_shape %[[ARG]] {{.}}[0, 1, 2, 3]
// C-HECK:         %[[READ1D:.+]] = vector.transfer_read %[[COLLAPSED]]
// C-HECK:         %[[VEC2D:.+]] = vector.shape_cast %[[READ1D]] : vector<120xi8> to vector<5x4x3x2xi8>
// C-HECK:         return %[[VEC2D]]

// -----

func @transfer_write_flattenable_with_offset(
      %arg : memref<5x4x3x2xi8, offset:?, strides:[24, 6, 2, 1]>, %vec : vector<5x4x3x2xi8>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %vec, %arg [%c0, %c0, %c0, %c0] : 
      vector<5x4x3x2xi8>, memref<5x4x3x2xi8, offset:?, strides:[24, 6, 2, 1]>
    return
}

// C-HECK-LABEL: func @transfer_write_flattenable_with_offset
// C-HECK-SAME:      %[[ARG:[0-9a-zA-Z]+]]: memref<5x4x3x2xi8
// C-HECK-SAME:      %[[VEC:[0-9a-zA-Z]+]]: vector<5x4x3x2xi8>
// C-HECK-DAG:     %[[COLLAPSED:.+]] = memref.collapse_shape %[[ARG]] {{.}}[0, 1, 2, 3]{{.}} : memref<5x4x3x2xi8, {{.+}}> into memref<120xi8, {{.+}}>
// C-HECK-DAG:     %[[VEC1D:.+]] = vector.shape_cast %[[VEC]] : vector<5x4x3x2xi8> to vector<120xi8>
// C-HECK:         vector.transfer_write %[[VEC1D]], %[[COLLAPSED]]

// -----

func @transfer_write_0d(%arg : memref<i8>, %vec : vector<i8>) {
      vector.transfer_write %vec, %arg[] : vector<i8>, memref<i8>
      return
}

// CHECK-LABEL: func @transfer_write_0d
// CHECK-SAME:       %[[ARG:.+]]: memref<i8>
// CHECK-SAME:       %[[VEC:.+]]: vector<i8>
// CHECK:          vector.transfer_write %[[VEC]], %[[ARG]][] : vector<i8>, memref<i8>
// CHECK:          return

// -----

func @transfer_read_0d(%arg : memref<i8>) -> vector<i8> {
      %cst = arith.constant 0 : i8
      %0 = vector.transfer_read %arg[], %cst : memref<i8>, vector<i8>
      return %0 : vector<i8>
}

// CHECK-LABEL: func @transfer_read_0d
// CHECK-SAME:       %[[ARG:.+]]: memref<i8>
// CHECK:            %[[CST:.+]] = arith.constant 0 : i8
// CHECK:            %[[READ:.+]] = vector.transfer_read %[[ARG]][], %[[CST]] : memref<i8>
// CHECK:            return %[[READ]]
