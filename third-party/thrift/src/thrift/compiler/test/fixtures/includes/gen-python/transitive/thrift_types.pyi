#
# Autogenerated by Thrift
#
# DO NOT EDIT
#  @generated
#

from __future__ import annotations


import typing as _typing

import folly.iobuf as _fbthrift_iobuf
import thrift.python.types as _fbthrift_python_types
import thrift.python.exceptions as _fbthrift_python_exceptions


class Foo(_fbthrift_python_types.Struct):
    a: _typing.Final[int] = ...
    def __init__(
        self, *,
        a: _typing.Optional[int]=...
    ) -> None: ...

    def __call__(
        self, *,
        a: _typing.Optional[int]=...
    ) -> _typing.Self: ...
    def __iter__(self) -> _typing.Iterator[_typing.Tuple[str, _typing.Union[int]]]: ...
    def _to_python(self) -> _typing.Self: ...
    def _to_py3(self) -> "transitive.types.Foo": ...  # type: ignore
    def _to_py_deprecated(self) -> "transitive.ttypes.Foo": ...  # type: ignore


ExampleFoo: Foo = ...
