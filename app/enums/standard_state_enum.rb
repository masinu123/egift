# include StandardStateEnum
module StandardStateEnum
  extend Enumerize

  STANDARD_STATE_DRAFT = 1
  STANDARD_STATE_ACTIVE = 10
  STANDARD_STATE_INACTIVE = 90

  enumerize :state,
            in: {
              draft: STANDARD_STATE_DRAFT,
              active: STANDARD_STATE_ACTIVE,
              inactive: STANDARD_STATE_INACTIVE
            },
            predicates: { prefix: true },
            scope: true,
            default: :active
end
