import { useEffect, useRef, useState } from "react";
import "./CustomDropdown.css";

export interface DropdownOption {
  value: string;
  label: string;
}

interface CustomDropdownProps {
  label?: string;
  value: string;
  options: DropdownOption[];
  placeholder?: string;
  onChange: (value: string) => void;
  disabled?: boolean;
}

export default function CustomDropdown({
  label,
  value,
  options,
  placeholder = "Select an option",
  onChange,
  disabled = false,
}: CustomDropdownProps) {
  const [open, setOpen] = useState(false);

  /*
    Controls whether the dropdown opens
    upward or downward.
  */
  const [openUpward, setOpenUpward] = useState(false);

  const dropdownRef =
    useRef<HTMLDivElement>(null);

  const buttonRef =
    useRef<HTMLButtonElement>(null);

  /*
    Close dropdown when clicking outside.
  */
  useEffect(() => {
    const handleClickOutside = (
      event: MouseEvent
    ) => {
      if (
        dropdownRef.current &&
        !dropdownRef.current.contains(
          event.target as Node
        )
      ) {
        setOpen(false);
      }
    };

    document.addEventListener(
      "mousedown",
      handleClickOutside
    );

    return () => {
      document.removeEventListener(
        "mousedown",
        handleClickOutside
      );
    };
  }, []);

  /*
    Decide whether the dropdown should open
    upward or downward.
  */
  const calculateDropdownDirection = () => {
    if (!buttonRef.current) {
      return;
    }

    const rect =
      buttonRef.current.getBoundingClientRect();

    const viewportHeight =
      window.innerHeight;

    /*
      Approximate maximum menu height.
      The actual menu has its own max-height.
    */
    const menuHeight = Math.min(
      options.length * 44 + 14,
      280
    );

    const spaceBelow =
      viewportHeight - rect.bottom;

    const spaceAbove = rect.top;

    /*
      If there isn't enough room below but
      there is more room above, open upward.
    */
    if (
      spaceBelow < menuHeight &&
      spaceAbove > spaceBelow
    ) {
      setOpenUpward(true);
    } else {
      setOpenUpward(false);
    }
  };

  /*
    Recalculate when dropdown opens.
  */
  useEffect(() => {
    if (!open) {
      return;
    }

    calculateDropdownDirection();

    const handleResize = () => {
      calculateDropdownDirection();
    };

    const handleScroll = () => {
      calculateDropdownDirection();
    };

    window.addEventListener(
      "resize",
      handleResize
    );

    window.addEventListener(
      "scroll",
      handleScroll,
      true
    );

    return () => {
      window.removeEventListener(
        "resize",
        handleResize
      );

      window.removeEventListener(
        "scroll",
        handleScroll,
        true
      );
    };
  }, [open, options.length]);

  /*
    Close the dropdown if it becomes disabled.
  */
  useEffect(() => {
    if (disabled) {
      setOpen(false);
    }
  }, [disabled]);

  const selectedOption = options.find(
    (option) =>
      option.value === value
  );

  const toggleDropdown = () => {
    if (disabled) {
      return;
    }

    if (!open) {
      calculateDropdownDirection();
    }

    setOpen((prev) => !prev);
  };

  return (
    <div
      className={`custom-dropdown-wrapper ${
        open
          ? "custom-dropdown-wrapper-open"
          : ""
      }`}
      ref={dropdownRef}
    >
      {label && (
        <label className="custom-dropdown-label">
          {label}
        </label>
      )}

      <button
        ref={buttonRef}
        type="button"
        className={`custom-dropdown-button ${
          open
            ? "custom-dropdown-open"
            : ""
        } ${
          disabled
            ? "custom-dropdown-disabled"
            : ""
        }`}
        onClick={toggleDropdown}
        disabled={disabled}
        aria-expanded={open}
      >
        <span>
          {selectedOption?.label ||
            placeholder}
        </span>

        <svg
          className={`custom-dropdown-arrow ${
            open
              ? "custom-dropdown-arrow-open"
              : ""
          }`}
          width="18"
          height="18"
          viewBox="0 0 24 24"
          fill="none"
        >
          <path
            d="M6 9L12 15L18 9"
            stroke="currentColor"
            strokeWidth="2"
            strokeLinecap="round"
            strokeLinejoin="round"
          />
        </svg>
      </button>

      {!disabled && (
        <div
          className={`custom-dropdown-menu ${
            open
              ? "custom-dropdown-menu-open"
              : ""
          } ${
            openUpward
              ? "custom-dropdown-menu-upward"
              : ""
          }`}
        >
          {options.length > 0 ? (
            options.map((option) => (
              <button
                type="button"
                key={option.value}
                className={`custom-dropdown-option ${
                  value === option.value
                    ? "custom-dropdown-option-selected"
                    : ""
                }`}
                onClick={() => {
                  onChange(option.value);
                  setOpen(false);
                }}
              >
                {option.label}
              </button>
            ))
          ) : (
            <div className="custom-dropdown-option">
              No options available
            </div>
          )}
        </div>
      )}
    </div>
  );
}