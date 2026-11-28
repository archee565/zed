(comment) @annotation

(preproc_def
  "#define" @context
  (identifier) @name) @item @item.constant

(preproc_function_def
  "#define" @context
  (identifier) @name
  (preproc_params
    "(" @context
    ")" @context)) @item @item.function

(struct_specifier
  "struct" @context
  (type_identifier) @name) @item @item.struct

(union_specifier
  "union" @context
  (type_identifier) @name) @item @item.struct

(enum_specifier
  "enum" @context
  (type_identifier) @name) @item @item.enum

(enumerator
  (identifier) @name) @item @item.enum_member

(declaration
  (layout_specification)? @context
  [
    "in"
    "out"
    "inout"
    "uniform"
    "shared"
    "attribute"
    "varying"
    "buffer"
    "coherent"
    "readonly"
    "writeonly"
    "precision"
    "highp"
    "mediump"
    "lowp"
    "subroutine"
    "centroid"
    "sample"
    "patch"
    "smooth"
    "flat"
    "noperspective"
    "invariant"
    "precise"
    (extension_storage_class)
  ]+ @context
  [
    (type_identifier)
    (primitive_type)
  ] @context
  [
    (identifier) @name
    (array_declarator
      (identifier) @name)
  ]) @item @item.variable

(declaration
  (layout_specification)? @context
  [
    "in"
    "out"
    "inout"
    "uniform"
    "shared"
    "buffer"
    "coherent"
    "readonly"
    "writeonly"
    (extension_storage_class)
  ]* @context
  (identifier) @name
  (field_declaration_list)) @item @item.struct

(field_declaration
  [
    (type_identifier)
    (primitive_type)
  ] @context
  [
    (field_identifier) @name
    (array_declarator
      (field_identifier) @name)
    (pointer_declarator
      (field_identifier) @name)
  ]) @item @item.field

(declaration
  "subroutine"? @context
  [
    (type_identifier)
    (primitive_type)
  ] @context
  (function_declarator
    (identifier) @name
    (parameter_list
      "(" @context
      ")" @context))) @item @item.function

(function_definition
  "subroutine"? @context
  [
    (type_identifier)
    (primitive_type)
  ] @context
  (function_declarator
    (identifier) @name
    (parameter_list
      "(" @context
      ")" @context))) @item @item.function
