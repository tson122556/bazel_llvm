// RUN: %clangxx %s -### -o %t.o -target amd64-unknown-freebsd -stdlib=platform 2>&1 \
// RUN:   | FileCheck --check-prefix=CHECK-DEFAULT %s
// RUN: %clangxx %s -### -o %t.o -target amd64-unknown-freebsd10.0 -stdlib=platform 2>&1 \
// RUN:   | FileCheck --check-prefix=CHECK-TEN %s
// RUN: %clangxx %s -### -o %t.o -target amd64-unknown-freebsd9.2 -stdlib=platform 2>&1 \
// RUN:   | FileCheck --check-prefix=CHECK-NINE %s
// CHECK-DEFAULT: "-lc++" "-lm"
// CHECK-TEN: "-lc++" "-lm"
// CHECK-NINE: "-lstdc++" "-lm"

// RUN: %clangxx %s -### -pg -o %t.o -target amd64-unknown-freebsd -stdlib=platform 2>&1 \
// RUN:   | FileCheck --check-prefix=CHECK-PG-DEFAULT %s
// RUN: %clangxx %s -### -pg -o %t.o -target amd64-unknown-freebsd14.0 -stdlib=platform 2>&1 \
// RUN:   | FileCheck --check-prefix=CHECK-PG-FOURTEEN %s
// RUN: %clangxx %s -### -pg -o %t.o -target amd64-unknown-freebsd10.0 -stdlib=platform 2>&1 \
// RUN:   | FileCheck --check-prefix=CHECK-PG-TEN %s
// RUN: %clangxx %s -### -pg -o %t.o -target amd64-unknown-freebsd9.2 -stdlib=platform 2>&1 \
// RUN:   | FileCheck --check-prefix=CHECK-PG-NINE %s
// CHECK-PG-DEFAULT: "-lc++" "-lm"
// CHECK-PG-FOURTEEN: "-lc++" "-lm"
// CHECK-PG-TEN: "-lc++_p" "-lm_p"
// CHECK-PG-NINE: "-lstdc++_p" "-lm_p"
