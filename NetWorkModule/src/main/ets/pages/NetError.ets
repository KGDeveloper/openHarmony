interface NetErrorDescription {
  description: string
  message?: string
  code: number
}

export class CLXError implements NetErrorDescription {
  code: number = 0
  message?: string

  public get description(): string {
    switch (this.code) {
      case 0:
      default:
    }
    return ''
  }

  constructor(code: number, message?: string) {
    this.code = code
    this.message = message
  }
}