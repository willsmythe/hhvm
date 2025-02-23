// @generated by Thrift for [[[ program path ]]]
// This file is probably not the place you want to edit!

package internals // [[[ program thrift source path ]]]

import (
    "fmt"

    thrift "github.com/facebook/fbthrift/thrift/lib/go/thrift"
)


// (needed to ensure safety because of naive import list construction)
var _ = fmt.Printf
var _ = thrift.ZERO


type InjectMetadataFields struct {
    Type string `thrift:"type,1" json:"type" db:"type"`
}
// Compile time interface enforcer
var _ thrift.Struct = &InjectMetadataFields{}

func NewInjectMetadataFields() *InjectMetadataFields {
    return (&InjectMetadataFields{}).
        SetTypeNonCompat("")
}

func (x *InjectMetadataFields) GetTypeNonCompat() string {
    return x.Type
}

func (x *InjectMetadataFields) GetType() string {
    return x.Type
}

func (x *InjectMetadataFields) SetTypeNonCompat(value string) *InjectMetadataFields {
    x.Type = value
    return x
}

func (x *InjectMetadataFields) SetType(value string) *InjectMetadataFields {
    x.Type = value
    return x
}

func (x *InjectMetadataFields) writeField1(p thrift.Protocol) error {  // Type
    if err := p.WriteFieldBegin("type", thrift.STRING, 1); err != nil {
        return thrift.PrependError(fmt.Sprintf("%T write field begin error: ", x), err)
    }

    item := x.GetTypeNonCompat()
    if err := p.WriteString(item); err != nil {
    return err
}

    if err := p.WriteFieldEnd(); err != nil {
        return thrift.PrependError(fmt.Sprintf("%T write field end error: ", x), err)
    }
    return nil
}

func (x *InjectMetadataFields) readField1(p thrift.Protocol) error {  // Type
    result, err := p.ReadString()
if err != nil {
    return err
}

    x.SetTypeNonCompat(result)
    return nil
}

func (x *InjectMetadataFields) String() string {
    type InjectMetadataFieldsAlias InjectMetadataFields
    valueAlias := (*InjectMetadataFieldsAlias)(x)
    return fmt.Sprintf("%+v", valueAlias)
}


// Deprecated: Use InjectMetadataFields.Set* methods instead or set the fields directly.
type InjectMetadataFieldsBuilder struct {
    obj *InjectMetadataFields
}

func NewInjectMetadataFieldsBuilder() *InjectMetadataFieldsBuilder {
    return &InjectMetadataFieldsBuilder{
        obj: NewInjectMetadataFields(),
    }
}

func (x *InjectMetadataFieldsBuilder) Type(value string) *InjectMetadataFieldsBuilder {
    x.obj.Type = value
    return x
}

func (x *InjectMetadataFieldsBuilder) Emit() *InjectMetadataFields {
    var objCopy InjectMetadataFields = *x.obj
    return &objCopy
}

func (x *InjectMetadataFields) Write(p thrift.Protocol) error {
    if err := p.WriteStructBegin("InjectMetadataFields"); err != nil {
        return thrift.PrependError(fmt.Sprintf("%T write struct begin error: ", x), err)
    }

    if err := x.writeField1(p); err != nil {
        return err
    }

    if err := p.WriteFieldStop(); err != nil {
        return thrift.PrependError(fmt.Sprintf("%T write field stop error: ", x), err)
    }

    if err := p.WriteStructEnd(); err != nil {
        return thrift.PrependError(fmt.Sprintf("%T write struct end error: ", x), err)
    }
    return nil
}

func (x *InjectMetadataFields) Read(p thrift.Protocol) error {
    if _, err := p.ReadStructBegin(); err != nil {
        return thrift.PrependError(fmt.Sprintf("%T read error: ", x), err)
    }

    for {
        _, typ, id, err := p.ReadFieldBegin()
        if err != nil {
            return thrift.PrependError(fmt.Sprintf("%T field %d read error: ", x, id), err)
        }

        if typ == thrift.STOP {
            break;
        }

        switch id {
        case 1:  // type
            if err := x.readField1(p); err != nil {
                return err
            }
        default:
            if err := p.Skip(typ); err != nil {
                return err
            }
        }

        if err := p.ReadFieldEnd(); err != nil {
            return err
        }
    }

    if err := p.ReadStructEnd(); err != nil {
        return thrift.PrependError(fmt.Sprintf("%T read struct end error: ", x), err)
    }

    return nil
}


// RegisterTypes registers types found in this file that have a thrift_uri with the passed in registry.
func RegisterTypes(registry interface {
	  RegisterType(name string, obj any)
}) {
    registry.RegisterType("facebook.com/thrift/annotation/InjectMetadataFields", &InjectMetadataFields{})

}
