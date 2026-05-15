package core

type PokapiError struct {
	IsPokapiError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewPokapiError(code string, msg string, ctx *Context) *PokapiError {
	return &PokapiError{
		IsPokapiError: true,
		Sdk:              "Pokapi",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *PokapiError) Error() string {
	return e.Msg
}
